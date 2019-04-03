FROM ubuntu:18.04

RUN apt-get update && apt-get install --yes git python3 wget
WORKDIR /
RUN git clone https://github.com/SynologyOpenSource/pkgscripts-ng
RUN /pkgscripts-ng/EnvDeploy -v 6.2 -p apollolake
COPY wireguard-build.sh /build_env/ds.apollolake-6.2/wireguard-build.sh
RUN chroot /build_env/ds.apollolake-6.2 /wireguard-build.sh
RUN mkdir /wireguard-build && \
    cp /build_env/ds.apollolake-6.2/WireGuard-0.0.20190227/src/wireguard.ko /wireguard-build/wireguard.ko && \
    cp /build_env/ds.apollolake-6.2/WireGuard-0.0.20190227/src/tools/wg /wireguard-build/wg && \
    cp /build_env/ds.apollolake-6.2/WireGuard-0.0.20190227/src/tools/wg-quick/linux.bash /wireguard-build/wg-quick && \
    ls -al /wireguard-build