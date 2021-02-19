FROM openjdk:11.0.10-jdk

ARG GRADLE_VERSION=6.8.2

RUN curl  https://downloads.gradle-dn.com/distributions/gradle-$GRADLE_VERSION-bin.zip --output gradle.zip && \
      unzip gradle.zip -d /usr/share/ && \
      mv /usr/share/gradle-$GRADLE_VERSION /usr/share/gradle && \
      ln -s /usr/share/gradle/bin/gradle /usr/bin/gradle && rm gradle.zip

RUN useradd --create-home user \
  && mkdir -p /home/user/.m2/repository \
  && chown -R user:user /home/user/.m2 /home/user/.m2/repository

ENV GRADLE_HOME /usr/share/gradle

USER user

CMD ["gradle", "--version"]