#!/bin/bash
#from docker ns3dce/mptcp:v0.89
sudo apt update
sudo apt install -y wget

SRC_DIR=$(cd $(dirname $0); pwd)
#download
git clone -b v0.92 https://github.com/multipath-tcp/mptcp.git
git clone -b libos-v4.4 https://github.com/libos-nuse/net-next-nuse/

#file copy

#1

cp -f net-next-nuse/fs/proc/proc_sysctl.c mptcp/fs/proc/

#2

cp -f net-next-nuse/include/linux/slab.h mptcp/include/linux/

cp -f net-next-nuse/mm/Makefile mptcp/mm/

cp -f net-next-nuse/mm/slab.h   mptcp/mm/

#3

cp -f net-next-nuse/include/linux/slib_def.h mptcp/include/linux/

cp -f net-next-nuse/mm/slib.c   mptcp/mm/

#4,9

mkdir mptcp/arch/lib

cp -f -r net-next-nuse/arch/lib/include mptcp/arch/lib/
rm -rf mptcp/arch/lib/generated
cp -f net-next-nuse/arch/lib/lib-device.c      mptcp/arch/lib/

cp -f net-next-nuse/arch/lib/lib-socket.c      mptcp/arch/lib/

cp -f net-next-nuse/arch/lib/lib.c             mptcp/arch/lib/

cp -f net-next-nuse/arch/lib/lib.h             mptcp/arch/lib/

#5

cp -f net-next-nuse/arch/lib/hrtimer.c         mptcp/arch/lib/

cp -f net-next-nuse/arch/lib/tasklet-hrtimer.c mptcp/arch/lib/

cp -f net-next-nuse/arch/lib/time.c            mptcp/arch/lib/

cp -f net-next-nuse/arch/lib/timer.c           mptcp/arch/lib/

#6

cp -f net-next-nuse/arch/lib/sched.c           mptcp/arch/lib/

cp -f net-next-nuse/arch/lib/softirq.c         mptcp/arch/lib/

cp -f net-next-nuse/arch/lib/tasklet.c         mptcp/arch/lib/

cp -f net-next-nuse/arch/lib/workqueue.c       mptcp/arch/lib/

#7

cp -f net-next-nuse/arch/lib/sysctl.c          mptcp/arch/lib/

#8

cp -f net-next-nuse/arch/lib/capability.c      mptcp/arch/lib/

cp -f net-next-nuse/arch/lib/filemap.c         mptcp/arch/lib/

cp -f net-next-nuse/arch/lib/fs.c              mptcp/arch/lib/

cp -f net-next-nuse/arch/lib/glue.c            mptcp/arch/lib/

cp -f net-next-nuse/arch/lib/modules.c         mptcp/arch/lib/

cp -f net-next-nuse/arch/lib/pid.c             mptcp/arch/lib/

cp -f net-next-nuse/arch/lib/print.c           mptcp/arch/lib/

cp -f net-next-nuse/arch/lib/proc.c            mptcp/arch/lib/

cp -f net-next-nuse/arch/lib/random.c          mptcp/arch/lib/

cp -f net-next-nuse/arch/lib/sysfs.c           mptcp/arch/lib/

cp -f net-next-nuse/arch/lib/vmscan.c          mptcp/arch/lib/

#10

cp -f net-next-nuse/arch/lib/.gitignore        mptcp/arch/lib/

cp -f net-next-nuse/arch/lib/Kconfig           mptcp/arch/lib/

cp -f net-next-nuse/arch/lib/Makefile          mptcp/arch/lib/

cp -f net-next-nuse/arch/lib/Makefile.print    mptcp/arch/lib/

cp -f net-next-nuse/arch/lib/defconfig         mptcp/arch/lib/

cp -f net-next-nuse/arch/lib/generate-linker-script.py mptcp/arch/lib/

#11

cp -f -r net-next-nuse/tools/testing/libos mptcp/tools/testing/

cd mptcp
make defconfig ARCH=lib

cd arch
patch -p1 < ../../mptcp_v092.patch

cd ..
make clean
make defconfig ARCH=lib
echo "Configure MPTCP settings."
read -p "Press Enter to continue..."
make menuconfig ARCH=lib
make defconfig ARCH=lib
make library ARCH=lib 

cp -rf arch/lib/include/ ~/mptcp-0.89/mptcp/arch/sim/
cd /home/ns3/mptcp-0.89/mptcp/arch/sim/test/buildtop/build/bin_dce/
ln -fs `echo ${SRC_DIR}/mptcp/arch/lib/tools/libsim-linux.so` liblinux.so

cd ~/mptcp-0.89/mptcp/arch/sim/test/buildtop/source/ns-3-dce/
./waf clean
./waf
