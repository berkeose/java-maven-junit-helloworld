FROM centos
#install java
RUN yum install -y java
#make directory structure to store temporary files
RUN mkdir -p /store
#put jar into container
#ADD target/AdWordsProducer-1.0-SNAPSHOT-shaded.jar adwordsproducer.jar
ADD target/java-maven-junit-helloworld-2.0-SNAPSHOT.jar java-maven-junit-helloworld.jar
#run jar
ENTRYPOINT ["java", "-jar", "/java-maven-junit-helloworld.jar"]
