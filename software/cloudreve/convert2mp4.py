#!/usr/bin/python
# -*- coding: UTF-8 -*-
import os
import sqlite3
import sys
import time
import traceback


reload(sys)
sys.setdefaultencoding('utf8')


def dispose_media(id, file_name, file_path, media_type, conn, cursor):
    target_file_name = file_name.replace(media_type, '_convert.mp4').replace(media_type.upper(), '_convert.mp4')
    target_file_path = file_path.replace(media_type, '_convert.mp4').replace(media_type.upper(), '_convert.mp4')
    update_sql = "update files set name = ? where ID=?"
    cursor.execute(update_sql, ("[转码中...]" + file_name, id))
    conn.commit()
    ffmpeg(file_path, target_file_path)
    update_sql = "update files set name =?,source_name=? where ID=?"
    cursor.execute(update_sql, (target_file_name, target_file_path, id))
    conn.commit()


def convert():
    conn = sqlite3.connect("/cloudreve/cloudreve.db")
    conn.text_factory = str
    cur = conn.cursor()

    cursor = cur.execute("select * from files")
    for row in cursor:
        id = str(row[0])
        file_name = str(row[4])
        file_path = str(row[5])
        if not file_name.endswith('_convert.mp4') and file_name.lower().endswith('.mp4'):
            dispose_media(id, file_name, file_path, '.mp4', conn, cursor)
        if not file_name.endswith('_convert.mp4') and file_name.lower().endswith('.avi'):
            dispose_media(id, file_name, file_path, '.avi', conn, cursor)
        if not file_name.endswith('_convert.mp4') and file_name.lower().endswith('.flv'):
            dispose_media(id, file_name, file_path, '.flv', conn, cursor)
        if not file_name.endswith('_convert.mp4') and file_name.lower().endswith('.rmvb'):
            dispose_media(id, file_name, file_path, '.rmvb', conn, cursor)
        if not file_name.endswith('_convert.mp4') and file_name.lower().endswith('.3gp'):
            dispose_media(id, file_name, file_path, '.3gp', conn, cursor)
        if not file_name.endswith('_convert.mp4') and file_name.lower().endswith('.rm'):
            dispose_media(id, file_name, file_path, '.rm', conn, cursor)
        if not file_name.endswith('_convert.mp4') and file_name.lower().endswith('.wmv'):
            dispose_media(id, file_name, file_path, '.wmv', conn, cursor)
        if not file_name.endswith('_convert.mp4') and file_name.lower().endswith('.mkv'):
            dispose_media(id, file_name, file_path, '.mkv', conn, cursor)
        if not file_name.endswith('_convert.mp4') and file_name.lower().endswith('.mov'):
            dispose_media(id, file_name, file_path, '.mov', conn, cursor)
    conn.close()


def ffmpeg(file_path, target_file_path):
    convert_result = os.system("ffmpeg -i '%s' -y -qscale 0 -vcodec libx264 '%s'" % (file_path, target_file_path))
    print(convert_result)


if __name__ == '__main__':
    while True:
        try:
            convert()
        except Exception as e:
            info = traceback.format_exc()
            print('Exception: %s' % info)
        time.sleep(5)
