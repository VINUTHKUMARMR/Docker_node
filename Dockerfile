FROM ubuntu
RUN apt-get update
RUN apt-get install default-jre -y  && apt-get install git -y && apt-get install maven -y  
WORKDIR /home/ubuntu/git/
RUN git clone https://github.com/koddas/war-web-project.git && pwd && ls
WORKDIR /home/ubuntu/git/war-web-project
RUN mvn clean install

