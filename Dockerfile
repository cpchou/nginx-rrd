FROM cpchou/centos_nginx
RUN yum -y update

RUN wget http://wcoserver.googlecode.com/files/nginx-rrd-0.1.4.tgz
RUN tar zxvf nginx-rrd-0.1.4.tgz
RUN cd nginx-rrd-0.1.4
RUN cp cp usr/sbin/* /usr/sbin #複製主程序文件到 /usr/sbin 下
RUN cp etc/nginx-rrd.conf /etc #複製配置文件到 /etc 下

RUN mkdir /data/wwwroot/nginx && mkdir /data/wwwroot/nginx/rrd
RUN cp html/index.PHP /usr/share/nginx/html/index.PHP


RUN bash -c 'echo -e "[dag]"' > /etc/yum.repos.d/dag.repo
RUN bash -c 'echo -e "name=Dag rpm Repository for Red Hat Enterprise Linux"' >> /etc/yum.repos.d/dag.repo
RUN bash -c 'echo -e "baseurl=http://apt.sw.be/redhat/el$releasever/en/$basearch/dag"' >> /etc/yum.repos.d/dag.repo
RUN bash -c 'echo -e "gpgcheck=1"' >> /etc/yum.repos.d/dag.repo
RUN bash -c 'echo -e "gpgkey=http://dag.wieers.com/rpm/packages/RPM-GPG-KEY.dag.txt"' >> /etc/yum.repos.d/dag.repo
RUN bash -c 'echo -e "enabled=1"' >> /etc/yum.repos.d/dag.repo

RUN yum install perl rrdtool perl-libwww-perl libwww-perl perl-rrdtool
