FROM       rayyildiz/base

# Java Version
ENV  JAVA_VERSION=9 \
     JAVA_UPDATE=ea \
     JAVA_BUILD=181  \
     JAVA_HOME=/usr/lib/jvm/current-java


# JDK http://download.oracle.com/otn-pub/java/jdk/9+181/jdk-9_linux-x64_bin.tar.gz
# JRE http://download.oracle.com/otn-pub/java/jdk/9+181/jre-9_linux-x64_bin.tar.gz


# JRE
RUN cd /tmp && wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
        "http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}+${JAVA_BUILD}/jre-${JAVA_VERSION}_linux-x64_bin.tar.gz" && \
     tar xzf "jre-${JAVA_VERSION}_linux-x64_bin.tar.gz" && \
     mkdir -p /usr/lib/jvm && mv "/tmp/jre-${JAVA_VERSION}" "/usr/lib/jvm/java-${JAVA_VERSION}-oracle"  && \
     ln -s "java-${JAVA_VERSION}-oracle" $JAVA_HOME && \
     ln -s $JAVA_HOME/bin/java /usr/bin/java && \
     rm -rf $JAVA_HOME/*.txt && \
     rm -rf $JAVA_HOME/*.html && \
     apk del wget ca-certificates curl && \
     rm /tmp/* /var/cache/apk/*

# JDK
# RUN cd /tmp && wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
#       "http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}+${JAVA_BUILD}/jdk-${JAVA_VERSION}_linux-x64_bin.tar.gz" && \
#    tar xzf "jdk-${JAVA_VERSION}_linux-x64_bin.tar.gz" && \
#    mkdir -p /usr/lib/jvm && mv "/tmp/jdk-${JAVA_VERSION}" "/usr/lib/jvm/java-${JAVA_VERSION}-oracle"  && \
#    ln -s "java-${JAVA_VERSION}-oracle" $JAVA_HOME && \
#    ln -s $JAVA_HOME/bin/java /usr/bin/java && \
#    rm -rf $JAVA_HOME/*.txt && \
#    rm -rf $JAVA_HOME/*.html && \
#    apk del wget ca-certificates curl && \
#    rm /tmp/* /var/cache/apk/*
