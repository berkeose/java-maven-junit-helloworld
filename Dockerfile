FROM centos
#install java
RUN yum install -y java
#make directory structure to store temporary files
RUN mkdir -p /store
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz
#put jar into container
#ADD target/AdWordsProducer-1.0-SNAPSHOT-shaded.jar adwordsproducer.jar
ADD target/AdWordsProducer-1.0-SNAPSHOT.jar adwordsproducer.jar
#run jar
ENTRYPOINT ["java", "-jar", "/adwordsproducer.jar"]
