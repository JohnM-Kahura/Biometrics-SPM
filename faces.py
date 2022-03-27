import cv2
import numpy as np
import face_recognition as faces
import os
from datetime import datetime

path = "Attendance_Images"
images = []
classNames = []
myList = os.listdir(path)

for lists in myList:
    currentImage = cv2.imread(f'{path}/{lists}')
    images.append(currentImage)
    classNames.append(os.path.splitext(lists)[0])
print(classNames)


def faceEncodings(images):
    encodedFaces = []
    for img in images:
        img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        face_encodings = faces.face_encodings(img)[0]
        encodedFaces.append(face_encodings)
    return encodedFaces


def MarkAttendence(name):
    with open('biometric_attendance.csv', 'r+') as f:
        myDatalist = f.readlines()
        nameList = []
        for line in myDatalist:
            entry = line.split(',')
            nameList.append(entry[0])

        if name not in nameList:
            now = datetime.now()
            timestr = now.strftime('%H:%M:%S')
            f.writelines(f'\n{name}, {timestr}')


encodedList = faceEncodings(images)
print('Encoding Complete!')

cap = cv2.VideoCapture(0)
while True:
    success, frame = cap.read()
    resizedImage = cv2.resize(frame, (0, 0), None, 0.25, 0.25)
    resizedImage = cv2.cvtColor(resizedImage, cv2.COLOR_BGR2RGB)

    facesCurFrame = faces.face_locations(resizedImage)
    encodesCurFrame = faces.face_encodings(resizedImage, facesCurFrame)

    for encodedFace, faceLocale in zip(encodesCurFrame, facesCurFrame):
        matches = faces.compare_faces(encodedList, encodedFace)
        faceDistance = faces.face_distance(encodedList, encodedFace)
        # print(faceDistance)
        matchIndex = np.argmin(faceDistance)

        if matches[matchIndex]:
            name = classNames[matchIndex].upper()
            print(name)
            y1, x2, y2, x1 = faceLocale
            y1, x2, y2, x1 = y1 * 4, x2 * 4, y2 * 4, x1 * 4
            cv2.rectangle(frame, (x1, y1), (x2, y2), (0, 255, 0), 3)
            cv2.rectangle(frame, (x1, y2 - 25), (x2, y2), (0, 255, 0), cv2.FILLED)
            cv2.putText(frame, name, (x1 + 6, y2 - 6), cv2.FONT_HERSHEY_COMPLEX_SMALL, 1, (255, 255, 255), 2)
            MarkAttendence(name)

    cv2.imshow('Attendance', frame)
    cv2.waitKey(1)
