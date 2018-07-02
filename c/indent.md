# Indent
Automated style adjustments for C code

### Install
```bash
sudo apt install indent
```

### Flags
```bash
vi ~/.indent.pro
```
Now enter the following
```vim
-bad
-bap
-bl
-blf
-bli0
-bbo
-bfda
-cbi0
-cli4
-ci4
-lc99
-npsl
-nlp
-hnl
-i4
-l99
-npcs
-nprs
-nut
-ip8
-cs
-saf
-sai
-saw
-ts4
```

### Running Indent
```bash
indent src/main.c
```
