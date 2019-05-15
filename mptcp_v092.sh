#!/bin/bash

#cd ~
git clone -b v0.92 https://github.com/multipath-tcp/mptcp.git
git clone -b libos-v4.4 https://github.com/libos-nuse/net-next-nuse/

#ファイルのコピーを自動化

#1

cp -f net-next-nuse/fs/proc/proc_sysctl.c mptcp-0.92/fs/proc/

#2

cp -f net-next-nuse/include/linux/slab.h mptcp-0.92/include/linux/

cp -f net-next-nuse/mm/Makefile mptcp-0.92/mm/

cp -f net-next-nuse/mm/slab.h   mptcp-0.92/mm/

#3

cp -f net-next-nuse/include/linux/slib_def.h mptcp-0.92/include/linux/

cp -f net-next-nuse/mm/slib.c   mptcp-0.92/mm/

#4,9

mkdir mptcp-0.92/arch/lib

cp -f -r net-next-nuse/arch/lib/include mptcp-0.92/arch/lib/
rm -rf mptcp-0.92/arch/lib/generated
cp -f net-next-nuse/arch/lib/lib-device.c      mptcp-0.92/arch/lib/

cp -f net-next-nuse/arch/lib/lib-socket.c      mptcp-0.92/arch/lib/

cp -f net-next-nuse/arch/lib/lib.c             mptcp-0.92/arch/lib/

cp -f net-next-nuse/arch/lib/lib.h             mptcp-0.92/arch/lib/

#5

cp -f net-next-nuse/arch/lib/hrtimer.c         mptcp-0.92/arch/lib/

cp -f net-next-nuse/arch/lib/tasklet-hrtimer.c mptcp-0.92/arch/lib/

cp -f net-next-nuse/arch/lib/time.c            mptcp-0.92/arch/lib/

cp -f net-next-nuse/arch/lib/timer.c           mptcp-0.92/arch/lib/

#6

cp -f net-next-nuse/arch/lib/sched.c           mptcp-0.92/arch/lib/

cp -f net-next-nuse/arch/lib/softirq.c         mptcp-0.92/arch/lib/

cp -f net-next-nuse/arch/lib/tasklet.c         mptcp-0.92/arch/lib/

cp -f net-next-nuse/arch/lib/workqueue.c       mptcp-0.92/arch/lib/

#7

cp -f net-next-nuse/arch/lib/sysctl.c          mptcp-0.92/arch/lib/

#8

cp -f net-next-nuse/arch/lib/capability.c      mptcp-0.92/arch/lib/

cp -f net-next-nuse/arch/lib/filemap.c         mptcp-0.92/arch/lib/

cp -f net-next-nuse/arch/lib/fs.c              mptcp-0.92/arch/lib/

cp -f net-next-nuse/arch/lib/glue.c            mptcp-0.92/arch/lib/

cp -f net-next-nuse/arch/lib/modules.c         mptcp-0.92/arch/lib/

cp -f net-next-nuse/arch/lib/pid.c             mptcp-0.92/arch/lib/

cp -f net-next-nuse/arch/lib/print.c           mptcp-0.92/arch/lib/

cp -f net-next-nuse/arch/lib/proc.c            mptcp-0.92/arch/lib/

cp -f net-next-nuse/arch/lib/random.c          mptcp-0.92/arch/lib/

cp -f net-next-nuse/arch/lib/sysfs.c           mptcp-0.92/arch/lib/

cp -f net-next-nuse/arch/lib/vmscan.c          mptcp-0.92/arch/lib/

#10

cp -f net-next-nuse/arch/lib/.gitignore        mptcp-0.92/arch/lib/

cp -f net-next-nuse/arch/lib/Kconfig           mptcp-0.92/arch/lib/

cp -f net-next-nuse/arch/lib/Makefile          mptcp-0.92/arch/lib/

cp -f net-next-nuse/arch/lib/Makefile.print    mptcp-0.92/arch/lib/

cp -f net-next-nuse/arch/lib/defconfig         mptcp-0.92/arch/lib/

cp -f net-next-nuse/arch/lib/generate-linker-script.py mptcp-0.92/arch/lib/

#11

cp -f -r net-next-nuse/tools/testing/libos mptcp-0.92/tools/testing/



cd mptcp-0.92

#Make defconfig ARCH=lib

