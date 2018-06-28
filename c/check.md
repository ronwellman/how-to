# Check framework
Used for unit-testing of C code.

### Required packages
1. check
1. pkg-config

### Define your tests in a small snippet

```bash
vi src/pasword_test.check
```

```c
#include "passwords.h"

#test password_test
    fail_unless(validate_pw("swordfish", "swordfish") == 1, "Correct passwords don't match");
    fail_unless(validate_pw("sword", "swordfish") == 0, "Incorrect passwords match");
```

### Generate test code
```bash
checkmk src/password_test.check > src/password_test.c
```

### Find the libraries you'll need to link to
```bash
pkg-config --cflags --libs check
```
This will output a list libraries to link to to:
1. -pthread
1. -lcheck_pic
1. -lrt
1. -lsubunit

### Compile the code
```bash
gcc -Wall -o src/password_test src/passwords.c src/password_test.c -pthread -lcheck_pic -lrt -lsubunit
```

### Run the Code
```bash
./src/password_test
```
