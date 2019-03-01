FROM ubuntu:18.10

RUN apt update

# basic gpu and audio stuff
RUN apt install -y libgl1-mesa-glx libxcursor1 libxinerama1 libsm6 mesa-utils mesa-utils-extra libxv1 libpulse0 pulseaudio pulseaudio-utils libpci3
# fix old libncursesw version
RUN ln -s /lib/x86_64-linux-gnu/libncursesw.so.6 /lib/x86_64-linux-gnu/libncursesw.so.5

# further rolauncher dependencies
RUN apt install -y libjpeg62 libxt6 libfreetype6 libglib2.0-0 libgdk-pixbuf2.0-0 libgtk2.0-0 wget
# fix old libpng version
RUN wget -O /tmp/libpng12-0.deb http://security.ubuntu.com/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1.1_amd64.deb
RUN dpkg -i /tmp/libpng12-0.deb
RUN rm /tmp/libpng12-0.deb
RUN apt remove -y wget

RUN rm -rf /var/lib/apt/lists*

COPY start_launcher.sh /
RUN chmod 755 /start_launcher.sh

ENTRYPOINT ["/start_launcher.sh"]
