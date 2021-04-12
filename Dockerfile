FROM jenkins/jenkins:2.287

USER root

RUN apt-get update && apt-get install -y curl

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false \
    -Djava.awt.headless=true \
    -Dhudson.model.ParametersAction.keepUndefinedParameters=true

USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN  install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
COPY seed-job.groovy /usr/share/jenkins/seed.groovy
COPY init.groovy /usr/share/jenkins/ref/init.groovy

