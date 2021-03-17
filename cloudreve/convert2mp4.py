#!/usr/bin/python
# -*- coding: UTF-8 -*-
import os
import sqlite3
import sys
import time


reload(sys)
sys.setdefaultencoding('utf8')


def convert():
    conn = sqlite3.connect("/cloudreve/cloudreve.db")
    cur = conn.cursor()

    cursor = cur.execute("select * from files")
    for row in cursor:
        id = str(row[0])
        file_name = str(row[4])
        file_path = str(row[5])
        if not file_name.endswith('.mp4') and file_name.endswith('.avi'):
            target_file_name = file_name.replace('.avi', '.mp4')
            target_file_path = file_path.replace('.avi', '.mp4')
            cursor.execute("update files set name ='%s' where ID=%s" % ("[转码中...]" + file_name, id))
            conn.commit()
            ffmpeg(file_path, target_file_path)
            cursor.execute("update files set name ='%s',source_name='%s' where ID=%s" % (target_file_name, target_file_path, id))
            conn.commit()
        if not file_name.endswith('.mp4') and file_name.endswith('.flv'):
            target_file_name = file_name.replace('.flv', '.mp4')
            target_file_path = file_path.replace('.flv', '.mp4')
            cursor.execute("update files set name ='%s' where ID=%s" % ("[转码中...]" + file_name, id))
            conn.commit()
            ffmpeg(file_path, target_file_path)
            cursor.execute("update files set name ='%s',source_name='%s' where ID=%s" % (target_file_name, target_file_path, id))
            conn.commit()
        if not file_name.endswith('.mp4') and file_name.endswith('.rmvb'):
            target_file_name = file_name.replace('.rmvb', '.mp4')
            target_file_path = file_path.replace('.rmvb', '.mp4')
            cursor.execute("update files set name ='%s' where ID=%s" % ("[转码中...]" + file_name, id))
            conn.commit()
            ffmpeg(file_path, target_file_path)
            cursor.execute("update files set name ='%s',source_name='%s' where ID=%s" % (target_file_name, target_file_path, id))
            conn.commit()
        if not file_name.endswith('.mp4') and file_name.endswith('.3gp'):
            target_file_name = file_name.replace('.3gp', '.mp4')
            target_file_path = file_path.replace('.3gp', '.mp4')
            cursor.execute("update files set name ='%s' where ID=%s" % ("[转码中...]" + file_name, id))
            conn.commit()
            ffmpeg(file_path, target_file_path)
            cursor.execute("update files set name ='%s',source_name='%s' where ID=%s" % (target_file_name, target_file_path, id))
            conn.commit()
        if not file_name.endswith('.mp4') and file_name.endswith('.rm'):
            target_file_name = file_name.replace('.rm', '.mp4')
            target_file_path = file_path.replace('.rm', '.mp4')
            cursor.execute("update files set name ='%s' where ID=%s" % ("[转码中...]" + file_name, id))
            conn.commit()
            ffmpeg(file_path, target_file_path)
            cursor.execute("update files set name ='%s',source_name='%s' where ID=%s" % (target_file_name, target_file_path, id))
            conn.commit()
        if not file_name.endswith('.mp4') and file_name.endswith('.wmv'):
            target_file_name = file_name.replace('.wmv', '.mp4')
            target_file_path = file_path.replace('.wmv', '.mp4')
            cursor.execute("update files set name ='%s' where ID=%s" % ("[转码中...]" + file_name, id))
            conn.commit()
            ffmpeg(file_path, target_file_path)
            cursor.execute("update files set name ='%s',source_name='%s' where ID=%s" % (target_file_name, target_file_path, id))
            conn.commit()
    conn.close()


def ffmpeg(file_path, target_file_path):
    convert_result = os.system("ffmpeg -i '%s' -y -qscale 0 -vcodec libx264 '%s'" % (file_path, target_file_path))
    print convert_result


if __name__ == '__main__':
    while True:
        try:
            convert()
            print 'xx'
        except Exception, msg:
            print 'error ..%s' % msg
        time.sleep(5)
