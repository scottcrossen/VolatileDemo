# Makefile by Scott Leland Crossen
# @Copyright 2017 Scott Leland Crossen

# ==== Definitions ====

BINDIR = bin
SOURCEDIR = src
RELDIR = rel
COMP = gcc
BINOBJS = ${BINDIR}/demo.o
COMPFLAGS = -g -Wall
LINKFLAGS = -lrt -lpthread
MAIN = ${RELDIR}/demo

# ==== Recipes ====

.PHONY: default
.DEFAULT: default
default: all

.PHONY: all
all: $(MAIN)

.PHONY: clean
clean:
	rm -rf $(BINDIR) $(RELDIR) $(MAIN)

# ==== Targets ====

${BINDIR}/%.o: ${SOURCEDIR}/%.c
	mkdir -p $(@D)
	$(COMP) -c $< -o $@ $(COMPFLAGS)

.PRECIOUS: ${RELDIR}/%
${RELDIR}/%: $(BINOBJS)
	mkdir -p $(@D)
	$(COMP) $^ -o $@ $(COMPFLAGS) $(LINKFLAGS)
