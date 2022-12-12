INST_DIR = $$HOME/test_for_make/

export ARCH=x86 64
export CROSS_COMPILE=x86_64-linux-

all:main.c list.c matrix.c
	$(CROOS_COMPILE)gcc -c list.c matrix.c
	$(CROOS_COMPILE)ar -r static.a list.o matrix.o
	$(CROOS_COMPILE)gcc -fpic -c list.c matrix.c
	$(CROOS_COMPILE)gcc -shared list.o matrix.o -o dynamic.so
	$(CROOS_COMPILE)gcc main.c list.c matrix.c -lm -o app.out
	echo $(ARCH)
	echo $(CROOS_COMPILE)

install: all
	@if [-d $(INST_DIR) ]; \
	then \
	cp app.out $(INST_DIR); \
	echo "The program was installed in $(INST_DIR)"; \
	else \
	echo "$(INST_DIR) not found."; \
fi

static: list.c matrix.c
	$(CROOS_COMPILE)gcc -c list.c matrix.c
	$(CROOS_COMPILE)ar -r static.a list.o matrix.o

dynamic: list.c matrix.c
	$(CROOS_COMPILE)gcc -fpic -c list.c matrix.c
	$(CROOS_COMPILE)gcc -shared list.o matrix.o -o dynamic.so

.PHONY: clean
clean:
	rm -rf *.o
