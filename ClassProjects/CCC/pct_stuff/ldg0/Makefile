ARCH = $(shell /bin/uname -m)
LIBS = -lm
CFLAGS = -Wall --std=gnu18 -funsigned-char $(LIBS)
INC = 
CC = gcc
SRC = $(shell /bin/ls -1 *.c 2>/dev/null)
BIN = $(SRC:.c=)
DESIG = unix
PROJ = ldg0
SEMESTER = fall2023
USERPWD = $(USERPATH)
PROJPWD = /var/public/$(SEMESTER)/$(DESIG)/$(PROJ)
BINPATH = .
all: clean $(SRC) $(BIN) 

debug: CFLAGS += -DDEBUG -g
debug: DEBUG = debug
debug: clean $(SRC) $(BIN) 

.c:
ifneq ($(MAKECMDGOALS),debug)
	@printf "[\033[0;33mCC\033[0m]   %-20s ... " "$<"
	@$(CC) $(INC) -o $@.$(ARCH) $< $(CFLAGS) 2>> errors && echo "\033[0;32mOK\033[0m" || echo "\033[0;31mFAIL\033[0m"
else
	$(CC)  $(INC) -o $@.$(ARCH) $< $(CFLAGS)
endif

copy:
	@cp -av $(PROJPWD)/* $(USERPWD)/
		
submit: save
	@submit $(DESIG) $(PROJ) `/bin/ls -1 ../$(PROJ)*gz | tail -1`

save: clean
	@echo
	@echo    "Project backup process commencing"
	@echo
	@echo -n "Taking snapshot of current project ($(PROJ))      ... "
	@(cd ..; /bin/tar cf $(PROJ)-`/bin/date +%Y%m%d-%H`.tar $(PROJ) && echo "OK" || echo "error")
	@echo -n "Compressing snapshot of $(PROJ) project archive   ... "
	@/bin/gzip -f -9 ../$(PROJ)-*.tar && echo "OK" || echo "error"
	@echo -n "Setting secure permissions on $(PROJ) archive     ... "
	@/bin/chmod 600 ../$(PROJ)-*.gz && echo "OK" || echo "error"
	@echo
	@echo    "Project backup process complete"
	@echo

run:
	@./ref_$(PROJ).$(ARCH)

update:
	@/bin/cp -f $(PROJPWD)/Makefile .

clean:
	@echo -n
