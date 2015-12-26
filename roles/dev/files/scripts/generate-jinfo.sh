#!/usr/bin/env bash
# ----------------------------------------------------------------------
# http://hostcode.sourceforge.net/view/367
# Description
# Setup a Java JDK with the alternatives system.
#
# Usage
# To setup the alternatives system:
# $ sudo ./configure-java.sh <jdk alias>
#
# To set the configured JDK as the system default one, you can then run:
# $ sudo update-java-alternatives -s <jdk alias>
#
# Prerequisites
# /usr/lib/jvm/<jdk alias> must point to the JDK to setup.
#
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
# Constants
# ----------------------------------------------------------------------

JDK_ALIAS=$1	#	Set it from command prompt
JDK_DIRECTORY=/usr/lib/jvm/$JDK_ALIAS
JDK_ALTERNATIVE_PRORITY=1
JINFO_FILE=/usr/lib/jvm/.$JDK_ALIAS.jinfo


# ----------------------------------------------------------------------
# Functions
# ----------------------------------------------------------------------

# Check the execution rights.
check_rights()
{
  if [[ $USER != 'root' ]]; then
echo "Error: You must run this script as root."
    exit 1
  fi
}

# Check that $JDK_DIRECTORY contains a Java JDK
check_jdk()
{
  if [[ ! -e $JDK_DIRECTORY ]] && [[ ! -e $JDK_DIRECTORY/jre/bin/java ]] && [[ ! -e $JDK_DIRECTORY/bin/java ]] ; then
echo "Error: '$JDK_DIRECTORY' must point to a valid Java JDK home."
    exit 1
  fi
}

# Register the JRE executable.
setup_jre_alternative()
{
  #update-alternatives --verbose --install /usr/bin/$1 $1 $JDK_DIRECTORY/jre/bin/$1 $JDK_ALTERNATIVE_PRORITY
  echo "jre $1 $JDK_DIRECTORY/jre/bin/$1" >> $JINFO_FILE
}

# Register the JDK executable.
setup_jdk_alternative()
{
  #update-alternatives --verbose --install /usr/bin/$1 $1 $JDK_DIRECTORY/bin/$1 $JDK_ALTERNATIVE_PRORITY
  echo "jdk $1 $JDK_DIRECTORY/bin/$1" >> $JINFO_FILE
}

# Start the .jinfo file.
generate_jinfo_header()
{
  echo "name=$JDK_ALIAS" > $JINFO_FILE
  echo "alias=$JDK_ALIAS" >> $JINFO_FILE
  echo "priority=$JDK_ALTERNATIVE_PRORITY" >> $JINFO_FILE
  echo "section=non-free" >> $JINFO_FILE
  echo "" >> $JINFO_FILE
}

register_all_executables()
{
    files=`ls -1 ${JDK_DIRECTORY}/bin`
    for f in ${files}
    do        
        setup_jdk_alternative ${f}                    
    done 
}


# ----------------------------------------------------------------------
# Main
# ----------------------------------------------------------------------

# Check execution rights.
check_rights

# Check that there is a JDK at the right place.
check_jdk

# Generate a .jinfo file for the update-java-alternatives command.
generate_jinfo_header

# Register the executables with the alternatives system.
register_all_executables

# Log a message about the jinfo file.
echo "The file '$JINFO_FILE' containing metadatas used by the 'update-java-alternatives' command has been generated."

echo "Running update-alternatives..."
cat /usr/lib/jvm/.${JDK_ALIAS}.jinfo | grep -E '^(jre|jdk)' | awk '{print "/usr/bin/" $2 " " $2 " " $3 " 30 \n"}' | xargs -t -n4 sudo update-alternatives --verbose --install

sudo update-alternatives --verbose --install /usr/lib/mozilla/plugins/libjavaplugin.so mozilla-javaplugin.so /usr/lib/jvm/${JDK_ALIAS}/jre/lib/amd64/libnpjp2.so 30

sudo update-java-alternatives -s ${JDK_ALIAS}

# TODO: Run the cat command below
# http://www.nick-prosch.de/?p=4228
# nick@silentbox /usr/lib/jvm $ cat .jdk1.6.31.jinfo | grep -E '^(jre|jdk)' | awk '{print "/usr/bin/" $2 " " $2 " " $3 " 30 \n"}' | xargs -t -n4 sudo update-alternatives --verbose --install
# nick@silentbox /usr/lib/jvm $ sudo update-alternatives --verbose --install /usr/lib/mozilla/plugins/libjavaplugin.so mozilla-javaplugin.so /usr/lib/jvm/jdk1.8.0/jre/lib/i386/libnpjp2.so 30
# nick@silentbox /usr/lib/jvm $ sudo update-alternatives --verbose --install /usr/lib/xulrunner-addons/plugins/libjavaplugin.so xulrunner-1.9-javaplugin.so /opt/jdk1.6.31/jre/lib/amd64/libnpjp2.so 30

