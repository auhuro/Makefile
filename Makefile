include Makefile_DETECT_OS
include Makefile_HEADER

program_NAME := main

program_SRC += ./
program_INCLUDE += ./

# ifeq ($(program_PLATFORM),OSX)
# program_LIBRARY_FRAMEWORK +=Cocoa
# program_LIBRARY_FRAMEWORK +=IOKit
# program_LIBRARY_FRAMEWORK +=ImageIO
# endif

#c++17
CPPFLAGS += -std=c++17
# CPPFLAGS += -stdlib=libc++
CPPFLAGS += -Wno-c++17-extensions
LDFLAGS := -Bstatic

#..........................................................................
include Makefile_AUTOMATIC
#..........................................................................
.PHONY: all clean distclean

all: $(program_NAME)
	./$(program_NAME)

$(program_NAME): $(program_OBJS)
	$(LINK.cc) -o $(program_NAME)

clean:
	@- $(RM) $(program_NAME)
	@- $(RM) $(program_OBJS)

distclean: clean

include Makefile_LIB_RULE

