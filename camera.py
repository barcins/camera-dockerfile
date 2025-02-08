# -*- coding: utf-8 -*-
# Your code goes below this line
# 

import cv2, time

video_capture = cv2.VideoCapture(0)
time.sleep(2)

if not video_capture.isOpened(): 
  print("kamera tanımadı")
  exit()


anterior = 0

while True:
    if not video_capture.isOpened():
        print('Unable to load camera. Use the command "xhost ss+"')
        pass

    # Capture frame-by-frame




    ret, frame = video_capture.read()

    if not ret:
        print('kamerada görüğntü yok.')
        break

    cv2.namedWindow("Video", 0)
    cv2.resizeWindow("Video", 800,600)


    # Display the resulting frame
    cv2.imshow('Video', frame)


    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

    # Display the resulting frame
    cv2.imshow('Video', frame)

# When everything is done, release the capture
video_capture.release()
cv2.destroyAllWindows()