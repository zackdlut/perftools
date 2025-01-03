FROM quay.io/rockylinux/rockylinux:9.5
LABEL description="perf tools images" 
ENV INSTALL_PKGS="bind-utils binutils blktrace bpftool coreutils-single dropwatch ethtool htop iotop iperf iproute iproute-tc iputils kernel-tools lksctp-tools lsof mtr net-tools nmap-ncat numactl pciutils perf procps-ng qperf strace sos sysstat tcpdump telnet traceroute util-linux valgrind vim-minimal container-tools"
RUN dnf install -y epel-release
RUN dnf install -y $INSTALL_PKGS && \
    dnf clean all
CMD ["/usr/bin/bash"]
