# install sonatype nexus
mkdir -p /opt/nexus
cd /opt/nexus
curl -sSOL "https://download.sonatype.com/nexus/3/nexus-${NEXUS_VERSION}-mac.tgz"
tar -zxvf nexus-${NEXUS_VERSION}-mac.tgz
rm nexus-${NEXUS_VERSION}-mac.tgz
export NEXUS_HOME="/opt/nexus/nexus-${NEXUS_VERSION}"
export PATH="$NEXUS_HOME/bin:$PATH"
sed 'i2 JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.332.b09-2.el8_6.aarch64/jre/bin/java' /opt/nexus/nexus-${NEXUS_VERSION}/bin/nexus
nexus run &