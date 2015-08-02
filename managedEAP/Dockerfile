# DOCKER-VERSION 0.3.4
FROM    psteiner/jonagent

MAINTAINER psteiner <psteiner@redhat.com>

##############################################
# Update the system and Install necessary RPMs
#############################################
RUN yum -y update; yum -y install unzip; yum clean all

##############################################
# Setup SSH
#############################################
RUN yum -y update; yum clean all
RUN yum -y install openssh-server; yum clean all
#ADD ./start.sh /start.sh
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' |chpasswd
RUN useradd padupa
RUN echo 'padupa:screencast' |chpasswd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 

#RUN chmod 755 /start.sh
# EXPOSE 22
#RUN ./start.sh
ENTRYPOINT ["/usr/sbin/sshd", "-D"]





#############################################
# Set all required environment variables
#############################################
ENV JAVA_HOME /usr/lib/jvm/jre

#############################################
# Install JBoss EAP 6.1.1
#############################################
RUN mkdir $HOME/eap
   
ADD . $HOME/tmp/
RUN chown -R jbosseap:jbosseap $HOME; chmod +x $HOME/tmp/*.sh

USER jbosseap

RUN /usr/bin/unzip -q $HOME/tmp/jboss-eap-6.1.*.zip -d $HOME/eap && \
    cp $HOME/tmp/mgmt-users.properties $HOME/eap/jboss-eap-6.1/standalone/configuration && \
    rm $HOME/tmp/*.zip

CMD $HOME/tmp/masterControlScript.sh 

EXPOSE 8080 9990 16163

# Build command -> docker build --rm -t psteiner/managed_eap .
# run command -> docker run --link jon:jon  -d psteiner/managed_eap
