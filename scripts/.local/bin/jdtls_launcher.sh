#!/usr/bin/env bash

JAR="/usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
GRADLE_HOME=$HOME/gradle /usr/lib/jvm/java-14-openjdk/bin/java \
  -Declipse.application=org.eclipse.jdt.ls.core.id1 \
  -Dosgi.bundles.defaultStartLevel=4 \
  -Declipse.product=org.eclipse.jdt.ls.core.product \
  -Dlog.protocol=true \
  -Dlog.level=ALL \
  -Xms1g \
  -Xmx2G \
  -jar $(echo "$JAR") \
  -configuration "/home/p00f/.config/jdtls" \
  -data "$HOME/workspace" \
  --add-modules=ALL-SYSTEM \
  --add-opens java.base/java.util=ALL-UNNAMED \
  --add-opens java.base/java.lang=ALL-UNNAMED
