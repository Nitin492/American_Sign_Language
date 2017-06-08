import cv2
import time
import numpy as np
import matlab.engine
cv2.ocl.setUseOpenCL(False)
cap = cv2.VideoCapture(0)
fgbg = cv2.createBackgroundSubtractorMOG2()
backgroundFrame = 500;

while (1):
    ret, frame = cap.read()
    if backgroundFrame > 0:
        fore = fgbg.apply(frame)
        backgroundFrame -=1;
        startTime = time.time()
    else:
        fore = fgbg.apply(frame,learningRate=0)
    if backgroundFrame == 1:

        print startTime
    back = fgbg.getBackgroundImage();
    kernel = np.ones((3, 3), np.uint8)
    fore = cv2.erode(fore, kernel, iterations=1)
    fore = cv2.dilate(fore, kernel, iterations=5)
    _, contours, _ = cv2.findContours(fore,cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)
    for contour in contours:
        if cv2.contourArea(contour) > 8500:
            tcontours = []
            hull = []
            tcontours.append(contour)
            cv2.drawContours(frame,contour,-1,(0,0,255),2)
            hull.insert(0,cv2.convexHull(tcontours[0],clockwise=False))
            cv2.drawContours(frame, hull, -1, (0, 255, 0), 2)
            x, y, w, h = cv2.boundingRect(tcontours[0])
            #x1, y1, w1, h1 = cv2.boundingRect(hull[0])
            cv2.rectangle(frame,(x,y-20),(x + 213,y + 193),(0,255,0),2,8,0)
            #cv2.rectangle(frame,(x1,y1),(x1+w1,y1+h1), (255, 255, 0), 2, 8, 0)
    if backgroundFrame > 0:
        cv2.putText(fore, "Recording Background", (30, 30), cv2.FONT_HERSHEY_COMPLEX_SMALL, 0.8,(200, 200, 250), 1, cv2.LINE_AA)
    else:
        diff = time.time() - startTime
        int_diff = int(diff)
        cv2.putText(fore, "Time:" + str(int_diff) , (30, 30), cv2.FONT_HERSHEY_COMPLEX_SMALL, 0.8, (200, 200, 250), 1,cv2.LINE_AA)
        if int_diff == 15:
            storage = frame
            crop_img = storage[y - 20 : y + 193, x : x + 213]
            g_img = cv2.cvtColor(crop_img, cv2.COLOR_RGB2GRAY)
            #img = cv2.fillConvexPoly(g_img, hull[0], (0, 0, 255))
            #cv2.imshow('mask', img)
            #print type(g_img)
            #print g_img
            cv2.imshow('crop', g_img)
            eng = matlab.engine.start_matlab()
            res = eng.testnet(matlab.uint8(g_img.tolist()))
            print res
            startTime = time.time()
    cv2.imshow('frame', frame)
    cv2.imshow('fgmask', fore)
    cv2.imshow('frame1', back)

    k = cv2.waitKey(30) & 0xff
    if k == 27:
        break

cap.release()
cv2.destroyAllWindows()