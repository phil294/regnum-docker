FROM ubuntu:20.04

# dependencies for rendering, glx, audio, rolauncher deps and game deps
RUN apt update && \
    apt install -y libgl1-mesa-glx libxcursor1 libxinerama1 libsm6 mesa-utils mesa-utils-extra libxv1 libpulse0 pulseaudio pulseaudio-utils libpci3 libjpeg62 libxt6 libfreetype6 libglib2.0-0 libgdk-pixbuf2.0-0 libgtk2.0-0 libtinfo5 libopenal1

# fix old libncursesw version
RUN ln -s /lib/x86_64-linux-gnu/libncursesw.so.6 /lib/x86_64-linux-gnu/libncursesw.so.5

# fix old libpng version
# not necessary anymore, it seems
#RUN wget -O /tmp/libpng12-0.deb http://security.ubuntu.com/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1.1_amd64.deb && \
#    dpkg -i /tmp/libpng12-0.deb && \
#    rm /tmp/libpng12-0.deb && \
#    apt remove -y wget

COPY start_launcher.sh /
RUN chmod 755 /start_launcher.sh

ENTRYPOINT ["/start_launcher.sh"]
