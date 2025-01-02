**Dockerfile**

```Dockerfile
FROM quay.io/rockylinux/rockylinux:9.5
ENV INSTALL_PKGS="bind-utils binutils blktrace bpftool coreutils-single dropwatch ethtool htop iotop iperf iproute iproute-tc iputils kernel-tools lksctp-tools lsof mtr net-tools nmap-ncat numactl pciutils perf procps-ng qperf strace sos sysstat tcpdump telnet traceroute util-linux valgrind vim-minimal"
RUN dnf install -y epel-release
RUN dnf install -y $INSTALL_PKGS && \
    dnf clean all
CMD ["/usr/bin/bash"]
```
**How to use this image**

```bash
#1. use oc debug command to debug node and change to host root
oc debug node/xxx-worker01
chroot  /root
#2. create a customized toolboxrc
cat <<EOF > ~/.toolboxrc
REGISTRY=quay.io
IMAGE=zack_zhang_ssp_registers/perf-tools:latest
EOF
#3. create toolbox with this container image
toolbox
```
