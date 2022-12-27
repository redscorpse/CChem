FROM debian:latest
RUN apt update

# new user
RUN useradd quantum; mkdir /home/quantum; chgrp quantum /home/quantum; chgrp quantum /home/quantum/
RUN apt install -y sudo
RUN usermod -aG sudo quantum
RUN echo 'quantum ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Chem Tools
RUN apt install -y python3 pip ipython3 vim

# working enviroment
USER quantum
WORKDIR /home/quantum
CMD ["bash"]

