.PHONY: init plan clean debug check install space
recursive = "initial"
recursive = $(recursive) new stuff

all: init plan execute


REQUIRED_DIRS = testdir1 testdir2 testdir3
# This simple assignment (i.e. not recursive and hence deferred) immediately gets its
# right hand side expanded and hence executed.
_MKDIRS := $(shell for d in $(REQUIRED_DIRS); \
		do \
			[[ -d $$d ]] || mkdir -p $$d; \
		done)

init: initfile
	cat initfile

plan: 
	cat planfile

execute: initfile planfile
	cat initfile planfile


debug:
	env

clean:
	rm -rf files.*

checkwithecho:
	which figmentofmyimagination

checkwithnoecho:
	@which figmentofmyimagination

# Ensure base dependencies are installed
check:
	@which bash


install: check
ifneq ($(shell which $(PYTHONVER) 2>/dev/null),)
	@echo "Python path found"
else
	@echo "You need to install Python"
endif
	echo $@
	echo $<

DF = df
AWK = awk
free-space := $(DF) . | $(AWK) 'NR == 2 { print $$4 }'

space:
	@$(free-space)

START_TIME := $(shell date)
CURRENT_TIME = $(shell date)
date:
	echo $(START_TIME)
	echo $(CURRENT_TIME)
	sleep 5
	echo $(START_TIME)
	echo $(CURRENT_TIME)



