#!/bin/bash

SRC_DIR=$(cd $(dirname $0); pwd)

cp -rf include/ ~/mptcp-0.89/mptcp/arch/sim/
cd /home/ns3/mptcp-0.89/mptcp/arch/sim/test/buildtop/build/bin_dce/
ln -fs `echo ${SRC_DIR}/so/libsim-linux.so` liblinux.so

cd ~/mptcp-0.89/mptcp/arch/sim/test/buildtop/source/ns-3-dce/
./waf clean
./waf
