FROM openjdk:11-oraclelinux8
# set version number
ARG gradleVersion="7.0"
# Set the directory to execute the command
RUN mkdir /opt/gradle
WORKDIR /opt/gradle
# install common library
RUN microdnf update && microdnf upgrade && microdnf install wget vim unzip zip
# install gradle
RUN curl -sSOL "https://services.gradle.org/distributions/gradle-${gradleVersion}-bin.zip"
RUN unzip -d /opt/gradle gradle-${gradleVersion}-bin.zip
ENV PATH /opt/gradle/gradle-${gradleVersion}/bin:$PATH
RUN gradle -v