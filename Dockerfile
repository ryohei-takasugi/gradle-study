FROM openjdk:11-oraclelinux8
# set arg
ARG gradleVersion="7.0"
# command run directory
RUN mkdir /opt/gradle
WORKDIR /opt/gradle
# install common lib
RUN microdnf update && microdnf upgrade && microdnf install wget vim unzip zip
# install gradle
RUN curl -sSOL "https://services.gradle.org/distributions/gradle-${gradleVersion}-bin.zip"
RUN unzip -d /opt/gradle gradle-${gradleVersion}-bin.zip
ENV PATH /opt/gradle/gradle-${gradleVersion}/bin:$PATH
RUN gradle -v