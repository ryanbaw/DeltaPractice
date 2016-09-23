#
# Copyright (c) 2010-2011 Oracle and/or its affiliates. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#   - Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
#
#   - Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in the
#     documentation and/or other materials provided with the distribution.
#
#   - Neither the name of Oracle nor the names of its
#     contributors may be used to endorse or promote products derived
#     from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
# IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

BASE_HOME=`pwd`

case "$1" in
build)
	mkdir -p $BASE_HOME/WebRoot/WEB-INF/classes/com/delta/practice/dao
	mkdir -p $BASE_HOME/WebRoot/WEB-INF/classes/com/delta/practice/dao/impl
	mkdir -p $BASE_HOME/WebRoot/WEB-INF/classes/com/delta/practice/entity
	mkdir -p $BASE_HOME/WebRoot/WEB-INF/classes/com/delta/practice/factory
	mkdir -p $BASE_HOME/WebRoot/WEB-INF/classes/com/delta/practice/filter
	mkdir -p $BASE_HOME/WebRoot/WEB-INF/classes/com/delta/practice/service
	mkdir -p $BASE_HOME/WebRoot/WEB-INF/classes/com/delta/practice/service/impl
	mkdir -p $BASE_HOME/WebRoot/WEB-INF/classes/com/delta/practice/servlet
	mkdir -p $BASE_HOME/WebRoot/WEB-INF/classes/com/delta/practice/utils

	TARGET_DIR=$BASE_HOME/WebRoot/WEB-INF/classes
	cd $BASE_HOME/src
	echo $"compiling classes ..."

	javac -d $TARGET_DIR com/delta/practice/entity/*.java
	javac -d $TARGET_DIR com/delta/practice/utils/*.java
	javac -d $TARGET_DIR com/delta/practice/factory/*.java
	javac -d $TARGET_DIR com/delta/practice/filter/*.java

	javac -d $TARGET_DIR -classpath com/delta/practice/entity:com/delta/practice/utils:$CLASSPATH com/delta/practice/dao/*.java
	javac -d $TARGET_DIR -classpath com/delta/practice/entity:com/delta/practice/utils:com/delta/practice/dao:$CLASSPATH com/delta/practice/dao/impl/*.java
	javac -d $TARGET_DIR -classpath com/delta/practice/entity:com/delta/practice/utils:$CLASSPATH com/delta/practice/service/*.java
	javac -d $TARGET_DIR -classpath com/delta/practice/entity:com/delta/practice/utils:com/delta/practice/dao:com/delta/practice/factory:com/delta/practice/service:$CLASSPATH com/delta/practice/service/impl/*.java
	javac -d $TARGET_DIR -classpath com/delta/practice/entity:com/delta/practice/utils:com/delta/practice/dao:com/delta/practice/factory:com/delta/practice/service:$CLASSPATH com/delta/practice/servlet/*.java

	cp c3p0-config.xml instance.properties $TARGET_DIR

	cd $BASE_HOME/WebRoot
	
	echo $"Create war package ..."
	jar cvf $BASE_HOME/DeltaPractice.war *.jsp *.html css images js sql WEB-INF

	cd $BASE_HOME
	cp DeltaPractice.war /home/pi/java/WebServ/apache-tomcat-8.0.24/webapps
	;;
update)
	cd $BASE_HOME/src
	cp c3p0-config.xml instance.properties $TARGET_DIR

	cd $BASE_HOME/WebRoot
	
	echo $"Create war package ..."
	jar cvf $BASE_HOME/DeltaPractice.war *.jsp *.html css images js sql WEB-INF

	cd $BASE_HOME
	cp DeltaPractice.war /home/pi/java/WebServ/apache-tomcat-8.0.24/webapps
	;;
clean)
	rm -rf $BASE_HOME/WebRoot/WEB-INF/classes/*
	rm DeltaPractice.war
	;;
*)
	echo $"Usage: $0 {build|clean}"
	exit 1
	;;
esac
