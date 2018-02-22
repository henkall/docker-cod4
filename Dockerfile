FROM centos:7
MAINTAINER matracey

ENV LANG=da_DK.UTF-8
ENV LANGUAGE=da_DK
ENV PORT=""
ENV MOD=""
ENV MAP=""
ENV EXTRA=""

#from http://cod4-linux-server.webs.com/
RUN yum -y install glibc.i686 libgcc.i686 libstdc++.i686 zlib.i686

RUN useradd cod4
ADD cod4 /home/cod4/
RUN chown -R cod4:cod4 /home/cod4

USER cod4
WORKDIR /home/cod4

#ENTRYPOINT ["/home/cod4/cod4x18_dedrun"]
#CMD ["+set sv_authorizemode '-1'", "+exec server.cfg", "+map_rotate"]

RUN chmod +x script.sh
ENTRYPOINT ["/home/cod4/script.sh"]

VOLUME ["/home/cod4/main"]
VOLUME ["/home/cod4/zone"]
VOLUME ["/home/cod4/mods"]
VOLUME ["/home/cod4/usermaps"]
VOLUME ["/home/cod4/main/server.cfg"]
