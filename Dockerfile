FROM centos

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y java

#make directory structure to store temporary files
RUN mkdir -p /store
#put jar into container

ADD target/java-maven-junit-helloworld-2.0-SNAPSHOT.jar java-maven-junit-helloworld.jar
#run jar
ENTRYPOINT ["java", "-jar", "/java-maven-junit-helloworld.jar"]
