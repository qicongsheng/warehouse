DockerRegisterCloud
https://github.com/xausky/DockerRegisterCloud

curl -o /tmp/drc-cli-linux.tar.gz https://www.qics.top/software/drc/drc-cli-linux.tar.gz
tar -zxvf /tmp/drc-cli-linux.tar.gz -C /usr/local/bin
chmod +x /usr/local/bin/drc
rm -fr /tmp/drc-cli-linux.tar.gz

drc login registry.cn-hangzhou.aliyuncs.com/qics/warehouse
username: 875881559@qq.com
password: Best12167

drc login ccr.ccs.tencentyun.com/qics/warehouse
username: 100004665025
password: Best12167

drc login qics/warehouse
username: qics
password: Best12167

drc ls
drc push z.mp4 /dirpath/z.mp4
drc rm /dirpath/z.mp4
drc pull /dirpath/z.mp4
mv data z.mp4



