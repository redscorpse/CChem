# CChem
A docker container with tools for computational chemistry.

I recommend placing all the files in a directory and share the display. 
<br>It can also be used fron vscode.

At the moment I am using the *arm64* version (from a Raspberry Pi):

```
docker run --name=chem -it -e DISPLAY=$DISPLAY -v /path/to/folder redscorpse/chem:arm64
```

But I've also been working to create an *amd64* version for any computer running a Linux OS:

```
docker run --name=chem -it -e DISPLAY=$DISPLAY -v /path/to/folder redscorpse/chem:amd64
```

The Dockerfile is NOT ready, because I need to learn more about developing containers. I'm still working on it, but at the moment the images can be used by just pulling them.
(I may study how to reduce their weight).


At the moment it includes:
- Editor: vim with intelligense ([coc](https://github.com/neoclide/coc.nvim)) and other plugins
- Python: python3, ipython
    - pip packages: numpy, matplotlib, pandas, tensorflow, pyscf, psi4, (...)
- [Psi4](https://github.com/psi4/psi4) (to save the time for building it)
- Avogadro2


If you try it, I would appreciate any suggestions for improving the project.
