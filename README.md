# CChem
A docker container with tools for computational chemistry.

At the moment I only have the *arm64* version (from Raspberry Pi):

```
docker pull redscorpse/chem:latest
```
The Dockerfile is for being able to build the image also on ***amd64*** architectures (which could be more effective for big calculations).


At the moment it includes:
- Editor: vim with intelligense ([coc](https://github.com/neoclide/coc.nvim)) and other plugins
- Python: python3, ipython
    - pip packages: numpy, matplotlib, pandas, tensorflow, pyscf, psi4, (...)
- [Psi4](https://github.com/psi4/psi4) (quite complicated for building)
