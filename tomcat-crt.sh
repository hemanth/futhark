#===============================================================================
#
#          FILE:  tomcat-crt.sh
# 
#         USAGE:  ./tomcat-crt.sh 
# 
#   DESCRIPTION:  Install SSL Certificate Tomcat bash script 
#       OPTIONS:  ---
#  REQUIREMENTS:  JAVA_HOME to be set, tomcat
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Hemanth H.M (), hemanth.hm@gmail.com
#       COMPANY:  ---
#       VERSION:  1.0
#       CREATED:  04/21/2010 12:10:34 AM IST
#      REVISION:  ---
#===============================================================================

:
[[ ! -d "${JAVA_HOME}" ]] || echo "JAVA_HOME not set in the path!" && exit 0

SECURITY_FOLDER="${JAVA_HOME}/jre/lib/security"

 if [ ! -d "${SECURITY_FOLDER}" ] ; then

 	SECURITY_FOLDER="${JAVA_HOME}/lib/security"

 if [ ! -d "${SECURITY_FOLDER}" ] ; then

	 echo "Your {JAVA_HOME} does not contain the expected security folder. ${JAVA_HOME}/jre/lib/security"

 exit 1

 fi

 fi

 $JAVA_HOME/bin/keytool -keystore keystore -alias acegisecurity -genkey -keyalg RSA -validity 710 -storepass changeit -keypass changeit

 $JAVA_HOME/bin/keytool -export -v -rfc -alias acegisecurity -file security.txt -keystore keystore -storepass changeit

 sudo cp security.txt ${SECURITY_FOLDER}

 cp -r keystore ${CXPS_RUNTIME}/tomcat/

 cd ${SECURITY_FOLDER}

 sudo $JAVA_HOME/bin/keytool -import -v -file security.txt -keypass changeit -keystore cacerts -storepass changeit -alias acegisecurity
