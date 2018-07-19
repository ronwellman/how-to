# Doxygen
Auto generate some of the documentation for your project.  I use doxygen to aid in the documentation of my C programs.  As of this writing, I am running Doxygen 1.8.13.

### Install
```bash
sudo apt install doxygen graphviz
```

### Generate Config
```bash
doxygen -g NEW_CONFIG_FILE
```

Now edit that config according to the options you want.  I typically turn off HTML as I only care about the LATEX file to build a PDF from. I also set my source and documentation folder.  Most of the defaults will be just fine.

```bash
vi NEW_CONFIG_FILE
```
I typically do the following:
 - PROJECT_NAME     = "Something"
 - HTML             = NO
 - OUTPUT_DIRECTORY = ./doc/
 - INPUT            = ./src/
 - RECURSIVE        = TRUE

I've had issues whenever my filenames have underscores in them.  I have more testing to do but it seems that when this happens, Doxygen sees the the file but does not capture my comments. Again, more testing needs to be completed to validate that this is what is actually causing my issues.

### Document Your Functions
I typically do this inside of my .h file.
```c
/**
 * \file timestable.h
 * \author Ron Wellman
 * \date 29 Jun 2018
 *
 * \brief Generates multiplication tables.
 *
 * Timestables generates multiplication tables to the CLI.  It accepts either
 * no arguments, in which case it will return a 10x10 table, a MAX number in
 * which case it will generate from table ranging from one to MAX, or you can
 * specify a custom MIN and MAX range.  Regardless of which inputs it is
 * given, it will only generate tables between 1 and 100 inclusive.
 */


#ifndef TIMESTABLE_H
#define TIMESTABLE_H

/**
 * strlen_nlz
 *
 * \brief counts the number of characters dropping leading zeros
 *
 * This function counts the number of elements in the character array dropping
 * any leading zeros.
 *
 * \param s character array
 * \return an integer indicating the size of the character array
 */
int strlen_nlz(const char* s);

#endif
```

### Run Doxygen
```bash
doxygen NEW_CONFIG_FILE
```
This will search your files for the doxygen comments and will output the resulting latex files.

### Build PDF
```bash
cd doc/latex/
make
```

### Combine With My Other PDFs and Output Final PDF
```bash
pdfunite doc/MY_PROGRAM.pdf doc/latex/refman.pdf doc/MY_PROGRAM_FINAL.pdf
```
