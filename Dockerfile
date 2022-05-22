FROM redhat/ubi8
USER root
RUN dnf install -y unzip java-1.8.0-openjdk-devel --nodocs && mkdir /opt/infinispan
ENV JAVA_HOME /etc/alternatives/jre
WORKDIR /opt/infinispan
ADD infinispan-server-11.0.15.Final/ /opt/infinispan/
RUN rm -rf /opt/infinispan/server/conf/infinispan.xml
ADD infinispan.xml /opt/infinispan/server/conf/
RUN cat /opt/infinispan/server/conf/infinispan.xml
RUN cd /opt/infinispan
RUN ls -al
RUN pwd
EXPOSE 11222
RUN chown -R root:root /opt/infinispan \
&& chmod -R g+rw /opt/infinispan
ENTRYPOINT ["/opt/infinispan/bin/server.sh", "-b", "0.0.0.0"]
#CMD  ["/usr/bin" ,"sh","/opt/infinispan/bin/server.sh"]
