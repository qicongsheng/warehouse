#!/usr/bin/env python
# -*- coding: utf-8 -*-
# pip install -i https://pypi.tuna.tsinghua.edu.cn/simple paramiko selenium loguru
# https://registry.npmmirror.com/binary.html?path=chromedriver/
import time
import traceback

import yagmail
import paramiko
from loguru import logger
from selenium import webdriver
from selenium.webdriver import ActionChains
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys


def send_mail(to=['875881559@qq.com'], subject=None, contents=None, attachments=[]):
    yag = yagmail.SMTP(user={"qicongsheng@foxmail.com": "playdocker"}, password="fqhhihxsfozwbeic", host='smtp.qq.com')
    yag.send(to, subject, contents, attachments)


def send_command(browser_, command_):
    logger.info('send_command start: %s' % command_)
    time.sleep(2)
    browser_.find_element(By.CLASS_NAME, "xterm-accessibility-tree").click()
    ActionChains(browser_).key_down(Keys.ENTER).key_up(Keys.ENTER).perform()
    for char_command in command_:
        ActionChains(browser_).key_down(char_command).key_up(char_command).perform()
        time.sleep(0.5)
    send_enter_command(browser_)
    logger.info('send_command end: %s' % command_)


def send_enter_command(browser_, times_=1):
    browser_.find_element(By.CLASS_NAME, "xterm-accessibility-tree").click()
    for t_i in range(times_):
        ActionChains(browser_).key_down(Keys.ENTER).key_up(Keys.ENTER).perform()
        time.sleep(2)


def start_docker_container_v2(browser_):
    logger.info('start_docker_container_v2...!')
    docker_msg = ''
    try:
        ssh_msg = browser_.find_element(By.XPATH, '//*[@id="input_3"]').get_attribute('value')
        logger.info(ssh_msg)
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        ssh.connect(hostname='direct.labs.play-with-docker.com', username=ssh_msg[4:-33])
        stdin, stdout, stderr = ssh.exec_command('curl -fsSL "https://www.qics.top/shell/play_frp.sh" | /bin/sh')
        logger.info(stdout.read().decode('utf-8'))
        stdin, stdout, stderr = ssh.exec_command('docker ps -a')
        docker_msg = stdout.read().decode('utf-8')
        logger.info(docker_msg)
        ssh.close()
        logger.info('start_docker_container_v2 end!')
    except Exception:
        logger.error('start_docker_container_v2 error!')
        traceback.print_exc()
    return docker_msg.__contains__('shadowsocks')


def start_docker_container_v1(browser_):
    logger.info('start_docker_container_v1...!')
    docker_msg = '\r\n'
    try:
        send_command(browser_, 'curl -fsSL "https://www.qics.top/shell/play_frp_ssr.sh" | /bin/sh')
        time.sleep(60 * 1)
        send_enter_command(browser_, times_=5)
        send_command(browser_, 'docker ps -a')
        time.sleep(60 * 1)
        for docker_msg_div in browser_.find_element(By.CLASS_NAME, "xterm-accessibility-tree").find_elements(By.TAG_NAME, 'div')[-15:-2]:
            msg = docker_msg_div.get_attribute('innerText')
            if msg[0] == '[' or msg[0] == '$' \
                    or msg.__contains__('CONTAINER ID') \
                    or msg.__contains__('IMAGE') \
                    or msg.__contains__('COMMAND') \
                    or msg.__contains__('CREATED') \
                    or msg.__contains__('STATUS') \
                    or msg.__contains__('PORTS') \
                    or msg.__contains__('NAMES'):
                continue
            should_split = msg.__contains__('ssr_server') or msg.__contains__('frp_client') or msg.__contains__('frp_sakura')
            docker_msg = (docker_msg + msg + ('\r\n' if should_split else ''))
        logger.info(docker_msg[:-2])
        logger.info('start_docker_container_v1 end!')
    except Exception:
        logger.error('start_docker_container_v1 error!')
        traceback.print_exc()
    return docker_msg.__contains__('ghcr.io/qicongsheng/shadowsocks')


def init_frp_vpn():
    inited = False
    browser = None
    try:
        options = Options()
        options.add_argument('--ignore-certificate-errors-spki-list')
        options.add_argument('log-level=3')
        browser = webdriver.Remote("http://127.0.0.1:4444/wd/hub", options=options)
        browser.implicitly_wait(60 * 5)
        # 设置超时时间
        browser.set_page_load_timeout(60 * 5)
        browser.maximize_window()
        # 打开网页
        browser.get("https://labs.play-with-docker.com/")
        browser.find_element(By.ID, 'btnGroupDrop1').click()
        browser.find_element(By.XPATH, '/html/body/div/div[2]/div/div/a').click()
        new_window = browser.window_handles[-1]
        browser.switch_to.window(new_window)
        logger.info('init_frp_vpn set username...')
        browser.find_element(By.ID, 'username').send_keys("qicongsheng")
        browser.find_element(By.XPATH, '/html/body/div/main/section/div[1]/div/div/div[1]/div/form/div[2]/button').click()
        logger.info('init_frp_vpn set password...')
        browser.find_element(By.ID, 'password').send_keys("Best12167")
        logger.info('init_frp_vpn click login btn...')
        browser.find_element(By.XPATH, '/html/body/div/main/section/div[1]/div/div/div[1]/div/form/div[2]/button').click()
        main_window = browser.window_handles[0]
        browser.switch_to.window(main_window)
        logger.info('init_frp_vpn click "Start" btn...')
        browser.find_element(By.XPATH, '//*[@id="landingForm"]/p/a').click()
        logger.info('init_frp_vpn click "ADD NEW INSTANCE" btn...')
        browser.find_element(By.XPATH, '//*[@id="popupContainer"]/md-sidenav/md-content/button').click()
        logger.info('init_frp_vpn click "IP & Node" btn...')
        browser.find_element(By.XPATH, '//*[@id="popupContainer"]/md-sidenav/md-content/md-list/md-list-item/div/button').click()
        inited = start_docker_container_v1(browser)
        inited = start_docker_container_v2(browser) if not inited else inited
    except Exception:
        logger.error('init_frp_vpn error!')
        traceback.print_exc()
    finally:
        if browser is not None:
            logger.info('init_frp_vpn destroy browser start...')
            browser.close()
            browser.quit()
            logger.info('init_frp_vpn destroy browser end!')
    return inited


if __name__ == '__main__':
    initSuccess = False
    while not initSuccess:
        logger.info('============================================================================================')
        logger.info('init_frp_vpn start!')
        send_mail(subject='init_frp_vpn start!', contents='init_frp_vpn start!')
        initSuccess = init_frp_vpn()
        _msg = 'init_frp_vpn end! initSuccess=%s' % initSuccess
        logger.info(_msg)
        send_mail(subject=_msg, contents=_msg)
        # 如果初始化成功，4小时跑一次。否则一分钟后重试
        if not initSuccess:
            _msg = 'init_frp_vpn retry after 3 minutes!'
            logger.info(_msg)
            send_mail(subject=_msg, contents=_msg)
            # 3分钟后重试
            time.sleep(60 * 3)
