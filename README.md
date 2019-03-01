# regnum-docker
Dependencies-only Docker image for running Regnum.

- Use Linux
- Get [x11docker](https://github.com/mviereck/x11docker)
- Use the Open Source graphics card driver. Proprietary NVIDIA drivers will most probably not work.
- Install Regnum Linux x64
- Install Docker
- Run: `x11docker --gpu --pulseaudio --home -- -v REGNUM_DIR:/regnum -- phil294/regnum`. Replace `REGNUM_DIR` with the installation path where `rolauncher` is located.
