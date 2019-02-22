import cv2
import numpy as np
import time
import threading
import face_recognition
import os
import base64   
import sys
import MySQLdb 

#打開數據庫連接
db = MySQLdb.connect ( "localhost" , "root" , "" , "laravel5" , charset = 'utf8' )     


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

# 接收攝影機串流影像，採用多執行緒的方式，降低緩衝區堆疊圖幀的問題。
class ipcamCapture:
    def __init__(self):
        self.Frame = []
        self.status = False
        self.isstop = False
        self.rgb_small_frame = []
        self.small_frame = []
	# 攝影機連接。
		capForFocal = cv2.VideoCapture(0)
		_,self.capture=capForFocal.read()
		capForFocal.release()
        self.face_locations = []
        self.face_encodings = []
        self.face_names = []


    def start(self):
	# 把程式放進子執行緒，daemon=True 表示該執行緒會隨著主執行緒關閉而關閉。
        print('ipcam started!')
        threading.Thread(target=self.queryframe, daemon=True, args=()).start()
        print('ipcam')	
        
        threading.Thread(target=self.identificationframe, daemon=True, args=()).start()
    def stop(self):
	# 記得要設計停止無限迴圈的開關。
        self.isstop = True

        print('ipcam stopped!')
   
    def getframe(self):

        return self.Frame
        
    def identificationframe(self):
        while (not self.isstop):
            self.face_locations = face_recognition.face_locations(self.rgb_small_frame,model="cnn")
            self.face_encodings = face_recognition.face_encodings(self.rgb_small_frame,self.face_locations)
            self.face_names = []
            if self.face_encodings:
                for face_encoding in self.face_encodings:
                    matches = face_recognition.compare_faces(known_face_encodings, face_encoding, tolerance=0.4)
                    name = "Unknown"
            # If a match was found in known_face_encodings, just use the first one.
                    if True in matches:
                        first_match_index = matches.index(True)
                        name = known_face_names[first_match_index]
                    self.face_names.append(name)
                for (top, right, bottom, left), name in zip(self.face_locations, self.face_names):
        # Scale back up face locations since the frame we detected in was scaled to 1/4 size
                    top *= 4
                    right *= 4
                    bottom *= 4
                    left *= 4
        # Draw a box around the face
                    cv2.rectangle(self.Frame, (left, top), (right, bottom), (0, 0, 255), 2)
        # 在紅框內放名字
                    cv2.rectangle(self.Frame, (left, bottom - 35), (right, bottom), (0, 0, 255), cv2.FILLED)
                    font = cv2.FONT_HERSHEY_DUPLEX
                    cv2.putText(self.Frame, name, (left + 6, bottom - 6), font, 1.0, (255, 255, 255), 1)


    def queryframe(self):
        while (not self.isstop):
            self.status, self.Frame = self.capture.read()
            self.small_frame = cv2.resize(self.Frame, (0, 0), fx=0.25, fy=0.25)
            self.rgb_small_frame =self.small_frame[:, :, ::-1] 
            
        self.capture.release()
# 連接攝影機
ipcam = ipcamCapture()

# 啟動子執行緒
ipcam.start()

# 暫停1秒，確保影像已經填充
time.sleep(1)

# 使用無窮迴圈擷取影像，直到按下Esc鍵結束
while True:
    # 使用 getframe 取得最新的影像
    I = ipcam.getframe()
    cv2.imshow('Image', I)
    if cv2.waitKey(10) == 27:
        cv2.destroyAllWindows()
        ipcam.stop()
        break
