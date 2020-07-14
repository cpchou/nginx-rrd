FROM cpchou/centos_nginx
RUN yum -y update

RUN wget http://soft.vpser.net/status/nginx-rrd/nginx-rrd-0.1.4.tgz
RUN tar zxvf nginx-rrd-0.1.4.tgz
RUN cd nginx-rrd-0.1.4
RUN cp /nginx-rrd-0.1.4/usr/sbin/* /usr/sbin #複製主程序文件到 /usr/sbin 下
RUN cp /nginx-rrd-0.1.4/etc/nginx-rrd.conf /etc #複製配置文件到 /etc 下

RUN mkdir /usr/share/nginx/rrd
RUN cp /nginx-rrd-0.1.4/html/index.PHP /usr/share/nginx/html/index.PHP

RUN yum install perl rrdtool perl-libwww-perl libwww-perl perl-rrdtool
