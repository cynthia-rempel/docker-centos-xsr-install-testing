FROM centos:7.5.1804
MAINTAINER not-me@na.com

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 && \
    yum install epel-release -y && \
    rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 && \
    yum update -y && \
    yum install unzip wget -y && \
    wget -O /etc/pki/rpm-gpg/RPM-GPG-KEY-psychotic http://wiki.psychotic.ninja/RPM-GPG-KEY-psychotic && \
    rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-psychotic && \
    wget http://packages.psychotic.ninja/7/base/x86_64/RPMS/psychotic-release-1.0.0-1.el7.psychotic.noarch.rpm && \
    yum localinstall psychotic-release-1.0.0-1.el7.psychotic.noarch.rpm -y && \
    rm psychotic-release-1.0.0-1.el7.psychotic.noarch.rpm && \
    yum-config-manager --enable psychotic && \
    yum install ImageMagick perl-HTML-Parser scrot xdotool xorg-x11-server-utils which -y && \
    wget https://github.com/nonnymoose/xsr/archive/master.zip && \
    unzip master.zip && \
    mv xsr-master /usr/share/xsr
COPY 10-inputs.conf xinitrc fvwm.config ./
# Install the testing environment
RUN yum install fvwm \
  mesa-dri-drivers \
  xorg-x11-apps \
  xorg-x11-drivers \
  xorg-x11-server-Xorg \
  xorg-x11-xinit -y && \
  mv xinitrc /root/.xinitrc && \
  mv fvwm.config /usr/share/fvwm/system.fvwm2rc

CMD ["init"] 
# Because I'm paranoid, and forgetful, added the following references
#  to remind myself "it's OK"
#  https://www.tecmint.com/yum-thirdparty-repositories-for-centos-rhel/
#  https://github.com/mviereck/x11docker
