FROM debian:latest
RUN apt update

# new user
RUN useradd quantum; mkdir /home/quantum; chown quantum /home/quantum; chgrp quantum /home/quantum/
RUN apt install -y sudo
RUN usermod -aG sudo quantum
RUN echo 'quantum ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Vim plugins configuration
ADD --chown=quantum:quantum vim/vim /home/quantum/.vim
ADD --chown=quantum:quantum vim/vimrc /home/quantum/.vimrc
RUN apt install -y git nodejs # for coc.nvim (intelligense)
RUN echo "RUN ':PlugInstall' inside vim"

# Use zsh shell and customize it
RUN apt install -y wget zsh


# Chem Tools
RUN apt install -y python3 pip ipython3 vim

RUN pip install numpy matplotlib pandas scipy sympy pyscf tensorflow


# Psi4 --- compile and install from source
# built on /root/psi4
RUN git clone https://github.com/psi4/psi4.git
RUN cd psi4; mkdir build; cd build
# RUN apt install -y cmake build-essential python3
RUN cmake ..
RUN make -j`getconf _NPROCESSORS_ONLN`
RUN make install
# requieres some other packages, as errors appear:
# RUN apt install -y libopenblas-dev
# RUN pip install numpy pydantic pint
# RUN echo 'export PATH=/root/psi4/bin:$PATH' >> ~/.zshrc
# RUN mkdir ~/psi4Files && echo 'export PSI_SCRATCH=/home/quantum/psi4Files' >> ~/.zshrc
# import psi4 in python:
# import sys; sys.path.append("/usr/local/psi4/lib"); import psi4



# working enviroment
USER quantum
WORKDIR /home/quantum
CMD ["zsh"]

