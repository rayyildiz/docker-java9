FROM       rayyildiz/base
MAINTAINER Ramazan AYYILDIZ <rayyildiz@gmail.com>

# Java Version
ENV  JAVA_VERSION=9 \
     JAVA_UPDATE=ea \
     JAVA_BUILD=181  \
     JAVA_HOME=/usr/lib/jvm/current-java

# JDK: http://www.java.net/download/java/jdk9/archive/145/binaries/jdk-9-ea+145_linux-x64_bin.tar.gz
# JRE: http://www.java.net/download/java/jdk9/archive/145/binaries/jre-9-ea+145_linux-x64_bin.tar.gz

# JRE http://download.java.net/java/jdk9/archive/178/binaries/jre-9+178_linux-x64_bin.tar.gz
# JDK http://download.java.net/java/jdk9/archive/178/binaries/jdk-9+178_linux-x64_bin.tar.gz



# JRE
RUN cd /tmp && wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
        "http://download.java.net/java/jdk9/archive/${JAVA_BUILD}/binaries/jre-${JAVA_VERSION}+${JAVA_BUILD}_linux-x64_bin.tar.gz" && \
     tar xzf "jre-${JAVA_VERSION}+${JAVA_BUILD}_linux-x64_bin.tar.gz" && \
     mkdir -p /usr/lib/jvm && mv "/tmp/jre-${JAVA_VERSION}" "/usr/lib/jvm/java-${JAVA_VERSION}-oracle"  && \
     ln -s "java-${JAVA_VERSION}-oracle" $JAVA_HOME && \
     ln -s $JAVA_HOME/bin/java /usr/bin/java && \
     rm -rf $JAVA_HOME/*.txt && \
     rm -rf $JAVA_HOME/*.html && \
     apk del wget ca-certificates curl && \
     rm /tmp/* /var/cache/apk/*

# JDK
#RUN cd /tmp && wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
#       "http://download.java.net/java/jdk9/archive/${JAVA_BUILD}/binaries/jdk-${JAVA_VERSION}+${JAVA_BUILD}_linux-x64_bin.tar.gz" && \
#    tar xzf "jdk-${JAVA_VERSION}-${JAVA_UPDATE}+${JAVA_BUILD}_linux-x64_bin.tar.gz" && \
#    mkdir -p /usr/lib/jvm && mv "/tmp/jdk-${JAVA_VERSION}" "/usr/lib/jvm/java-${JAVA_VERSION}-oracle"  && \
#    ln -s "java-${JAVA_VERSION}-oracle" $JAVA_HOME && \
#    ln -s $JAVA_HOME/bin/java /usr/bin/java && \
#    rm -rf $JAVA_HOME/*.txt && \
#    rm -rf $JAVA_HOME/*.html && \
#    apk del wget ca-certificates curl && \
#    rm /tmp/* /var/cache/apk/*
