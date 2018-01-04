#!/bin/sh
:
:   Start app
:
# Resolve location
PRG="$0"
PRGDIR=`dirname "$PRG"`

# Check that Java's location is defined
MY_JAVA="$JRE_HOME"

if [ -z "$MY_JAVA" ]; then
  MY_JAVA="$JAVA_HOME"
fi

if [ -z "$MY_JAVA" ]; then
  echo You must set JRE_HOME or JAVA_HOME ;
  exit ;
fi

# Does Java actually live here?
if [ ! -f "$MY_JAVA/bin/java" ]; then
  echo $MY_JAVA/bin/java not found ;
  exit ;
fi

if [ "$1" = "--help" -o "$1" = "-h" ]; then
  echo "usage: ./hello.sh [-h|--help]" ;
  echo "  -> prints 'Hello world.' to console." ;
  exit ;
fi

# Run program.
# Admins should add JMX params such as
#    -Dcom.sun.management.jmxremote -Xmx64M \
#    -Dlog4j.configuration="file:///Users/admin/settings/log4j.properties" \
$MY_JAVA/bin/java -Djava.awt.headless=true \
    -cp "$PRGDIR/../lib/*:$PRGDIR/gradle-bug-1.0.jar" \
    com.johnthad.gradle.appbug.HelloWorld

echo Exit status: $?
