#!/usr/bin/env python
# coding: utf-8

# In[4]:


# -*- coding: utf-8 -*-
import face_recognition
import cv2
import os
import base64   
import sys


import MySQLdb 

#打開數據庫連接
db = MySQLdb.connect ( "localhost" , "root" , "0000" , "laravel5" , charset = 'utf8' )     


# 使用cursor()方法获取操作游标
cursor = db.cursor()
# SQL 查询语句
sql = "SELECT `image_file` FROM `images`"  
# 执行SQL语句    
cursor.execute(sql)    
# 获取所有记录列表    

rc = cursor.rowcount

known_face_encodings = []
known_face_names = []
face_encoding = []
rerecord = []
record = cursor.fetchall()
encod = ""
for (row,) in record:
    rerecord += [row]
for i2 in range(0, rc):
    encod = rerecord[i2]
    encod = encod.partition(",")[2]
    img = base64.b64decode(encod)
    file = open(str(i2)+'.jpg','wb') 
    file.write(img)  
    file.close()
    encod = ""
    face_encoding += [str(i2)+'.jpg']
for i3 in range(0, rc):
    known_face_encodings += [face_recognition.face_encodings(face_recognition.load_image_file(face_encoding[i3]))[0]]
                           
sql2 = "SELECT `name` FROM `users`"
cursor.execute(sql2)    
# 获取所有记录列表    

rc2 = cursor.rowcount
rerecord2 = []
record2 = cursor.fetchall()
for (row,) in record2:
    rerecord2 += [row]
for i2 in range(0, rc):
    known_face_names += [rerecord2[i2]]



# 关闭游标,关闭连接;
cursor.close()
db.close()

video_capture = cv2.VideoCapture(0)
# Initialize some variables
face_locations = []
face_encodings = []
face_names = []
process_this_frame = True

while True:
    # Grab a single frame of video
    ret, frame = video_capture.read()
   
    # Resize frame of video to 1/4 size for faster face recognition processing
    small_frame = cv2.resize(frame, (0, 0), fx=0.25, fy=0.25)

    # Convert the image from BGR color (which OpenCV uses) to RGB color (which face_recognition uses)
    rgb_small_frame = small_frame[:, :, ::-1]

    # Only process every other frame of video to save time
    if process_this_frame:
        # Find all the faces and face encodings in the current frame of video
        face_locations = face_recognition.face_locations(rgb_small_frame,model="cnn")
        face_encodings = face_recognition.face_encodings(rgb_small_frame, face_locations)

        face_names = []
        for face_encoding in face_encodings:
            
            # See if the face is a match for the known face(s)
            
            matches = face_recognition.compare_faces(known_face_encodings, face_encoding, tolerance=0.4)
            name = "Unknown"

            # If a match was found in known_face_encodings, just use the first one.
            if True in matches:
                first_match_index = matches.index(True)
                name = known_face_names[first_match_index]

            face_names.append(name)
    process_this_frame = not process_this_frame


    # Display the results
    for (top, right, bottom, left), name in zip(face_locations, face_names):
        # Scale back up face locations since the frame we detected in was scaled to 1/4 size
        top *= 4
        right *= 4
        bottom *= 4
        left *= 4

        # Draw a box around the face
        cv2.rectangle(frame, (left, top), (right, bottom), (0, 0, 255), 2)

        # 在紅框內放名自字
        cv2.rectangle(frame, (left, bottom - 35), (right, bottom), (0, 0, 255), cv2.FILLED)
        font = cv2.FONT_HERSHEY_DUPLEX
        cv2.putText(frame, name, (left + 6, bottom - 6), font, 1.0, (255, 255, 255), 1)

    # 使用即時影像
    cv2.imshow('Video', frame)

    # 案Q來離開
    #print (face_names, "3") 
    #:
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break
    elif 'Unknown' not in face_names and face_names:
        print(face_names) 
        break
    

# Release handle to the webcam
video_capture.release()
cv2.destroyAllWindows()
print(face_names)


# In[ ]:





# In[ ]:




