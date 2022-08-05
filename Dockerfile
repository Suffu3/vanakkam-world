From ubuntu
RUN sudo app update
RUN sudo app upgrade
RUN sudo app install java -y
RUN sudo app install wget -y
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.65/bin/apache-tomcat-9.0.65.tar.gz
RUN tar -zxvf apache-tomcat-9.0.65.tar.gz
RUN sudo rm -rf apache-tomcat-9.0.65.tar.gz
RUN mv apache-tomcat-9.0.65/ tomcat
COPY .jenkins/workspace/vw-task/webapp/target/webapp.war /usr/local/tomcat/webapps
CMD ["/home/ec2-user/tomcat/bin/catalina.sh", "run"]
