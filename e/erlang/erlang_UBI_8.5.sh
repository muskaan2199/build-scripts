#!/bin/bash -e
# -----------------------------------------------------------------------------
#
# Package	: erlang
# Version	: OTP-25.0
# Source repo	: https://github.com/erlang/otp.git
# Tested on	: UBI: 8.5
# Language      : Java
# Travis-Check  : True
# Script License: Apache License, Version 2 or later
# Maintainer	: Muskaan Sheik <Muskaan.Sheik@ibm.com>
#
# Disclaimer: This script has been tested in root mode on given
# ==========  platform using the mentioned version of the package.
#             It may not work as expected with newer versions of the
#             package and/or distribution. In such case, please
#             contact "Maintainer" of this script.
#
# ----------------------------------------------------------------------------

PACKAGE_NAME=erlang
PACKAGE_VERSION=${1:-OTP-25.0}
PACKAGE_URL=https://github.com/erlang/otp.git

yum install -y sudo
yum install -y sudo git make unzip tar gcc-c++ gcc clang ncurses ncurses-devel sed java

git clone $PACKAGE_URL
cd otp
git checkout $PACKAGE_VERSION

./configure

if ! make; then
	echo "------------------Build_Install_fails---------------------"
else
	echo "------------------Build_Install_success-------------------------"
	echo "$PACKAGE_NAME  | $PACKAGE_VERSION "
fi



if ! make install; then
	echo "------------------Test_fails---------------------"
else
	echo "------------------Test_success-------------------------"
	echo "$PACKAGE_NAME  | $PACKAGE_VERSION |"
fi

