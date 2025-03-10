#========================================
# USER RESERVED -- The following are reserved for users to set on the
# command line.  Makefiles should not set these.  These variables are
# for C/C++ compilation, and linking.
## -pg is for use with gprof.  Use on CFLAGS and on LDFLAGS
CFLAGS		= -w
#CFLAGS         = -Winline
#JFLAGS		=
#LDFLAGS	= -pg

# OPTIMIZE with the -O option.  Override from the command line for
# building debug versions.
#
#OPTFLAGS	= -O3 -funroll-loops -DNDEBUG=1

#========================================
### For Seqan support (required):
SEQAN_CFLAGS 	= -I./seqan
SEQAN_LDFLAGS 	=
SEQAN_LIBS	=

#========================================
## For the HMMoC-BFloat-Algebra library (required):
ALGEBRA_CFLAGS 	= -I./HMMoC-BFloat-Algebra
ALGEBRA_LDFLAGS = -L./HMMoC-BFloat-Algebra
ALGEBRA_LIBS	= -lHMMoC-BFloat-Algebra

#========================================
## For the prolific library (required):
PROLIFIC_CFLAGS 	= -I./prolific
PROLIFIC_LDFLAGS	=
PROLIFIC_LIBS		=

#========================================
## For Boost support (required):
BOOST_CFLAGS 	= -I./boost-include
BOOST_LDFLAGS 	= -L./boost-lib
BOOST_LIBS	= -lboost_serialization -lboost_graph -lboost_filesystem -lboost_system

#========================================
### Paul added these for HMMER 3.0 (and easel) support (required):
HMMER3_CFLAGS 	= -I. -I./hmmer-3.0/src -I./hmmer-3.0/easel
HMMER3_LDFLAGS 	= -L./hmmer-3.0/src -L./hmmer-3.0/easel -L./hmmer-3.0/src/impl
HMMER3_LIBS	= -leasel -lhmmer -lhmmerimpl
#HMMER3_CFLAGS 	=
#HMMER3_LDFLAGS 	=
#HMMER3_LIBS	=

###==============================================

PROFILLIC_HMMBUILD_INCS = profillic-hmmer.hpp \
profillic-p7_builder.hpp \
profillic-esl_msa.hpp

PROFILLIC_HMMBUILD_OBJS = profillic-hmmbuild.o

PROFILLIC_HMMBUILD_SOURCES = profillic-hmmbuild.cpp


PROFILLIC_HMMTOPROFILE_INCS = profillic-hmmer.hpp

PROFILLIC_HMMTOPROFILE_OBJS = profillic-hmmtoprofile.o

PROFILLIC_HMMTOPROFILE_SOURCES = profillic-hmmtoprofile.cpp


PROFILLIC_HMMCALIBRATE_INCS = profillic-hmmer.hpp

PROFILLIC_HMMCALIBRATE_OBJS = profillic-hmmcalibrate.o

PROFILLIC_HMMCALIBRATE_SOURCES = profillic-hmmcalibrate.cpp


PROFILLIC_HMMUNIFYTRANSITIONS_INCS = profillic-hmmer.hpp

PROFILLIC_HMMUNIFYTRANSITIONS_OBJS = profillic-hmmunifytransitions.o

PROFILLIC_HMMUNIFYTRANSITIONS_SOURCES = profillic-hmmunifytransitions.cpp


PROFILLIC_HMMCOPYTRANSITIONS_INCS = profillic-hmmer.hpp

PROFILLIC_HMMCOPYTRANSITIONS_OBJS = profillic-hmmcopytransitions.o

PROFILLIC_HMMCOPYTRANSITIONS_SOURCES = profillic-hmmcopytransitions.cpp


default: all

profillic-hmmbuild: $(PROFILLIC_HMMBUILD_SOURCES) $(PROFILLIC_HMMBUILD_INCS) $(PROFILLIC_HMMBUILD_OBJS) $(MUSCLE_CPPOBJ)
	     $(CXX_LINK) -o profillic-hmmbuild $(PROFILLIC_HMMBUILD_OBJS) $(MUSCLE_CPPOBJ) $(CXX_LIBS)

profillic-hmmtoprofile: $(PROFILLIC_HMMTOPROFILE_SOURCES) $(PROFILLIC_HMMTOPROFILE_INCS) $(PROFILLIC_HMMTOPROFILE_OBJS) $(MUSCLE_CPPOBJ)
	     $(CXX_LINK) -o profillic-hmmtoprofile $(PROFILLIC_HMMTOPROFILE_OBJS) $(MUSCLE_CPPOBJ)

profillic-hmmcalibrate: $(PROFILLIC_HMMCALIBRATE_SOURCES) $(PROFILLIC_HMMCALIBRATE_INCS) $(PROFILLIC_HMMCALIBRATE_OBJS) $(MUSCLE_CPPOBJ)
	     $(CXX_LINK) -o profillic-hmmcalibrate $(PROFILLIC_HMMCALIBRATE_OBJS) $(MUSCLE_CPPOBJ)

profillic-hmmunifytransitions: $(PROFILLIC_HMMUNIFYTRANSITIONS_SOURCES) $(PROFILLIC_HMMUNIFYTRANSITIONS_INCS) $(PROFILLIC_HMMUNIFYTRANSITIONS_OBJS) $(MUSCLE_CPPOBJ)
	     $(CXX_LINK) -o profillic-hmmunifytransitions $(PROFILLIC_HMMUNIFYTRANSITIONS_OBJS) $(MUSCLE_CPPOBJ)

profillic-hmmcopytransitions: $(PROFILLIC_HMMCOPYTRANSITIONS_SOURCES) $(PROFILLIC_HMMCOPYTRANSITIONS_INCS) $(PROFILLIC_HMMCOPYTRANSITIONS_OBJS) $(MUSCLE_CPPOBJ)
	     $(CXX_LINK) -o profillic-hmmcopytransitions $(PROFILLIC_HMMCOPYTRANSITIONS_OBJS) $(MUSCLE_CPPOBJ)

all: profillic-hmmbuild profillic-hmmtoprofile profillic-hmmcalibrate profillic-hmmunifytransitions profillic-hmmcopytransitions

## Recompile if the includes are modified ...
$(PROFILLIC_HMMBUILD_OBJS): $(PROFILLIC_HMMBUILD_SOURCES) $(PROFILLIC_HMMBUILD_INCS)
$(PROFILLIC_HMMTOPROFILE_OBJS): $(PROFILLIC_HMMTOPROFILE_SOURCES) $(PROFILLIC_HMMTOPROFILE_INCS)
$(PROFILLIC_HMMCALIBRATE_OBJS): $(PROFILLIC_HMMCALIBRATE_SOURCES) $(PROFILLIC_HMMCALIBRATE_INCS)
$(PROFILLIC_HMMUNIFYTRANSITIONS_OBJS): $(PROFILLIC_HMMUNIFYTRANSITIONS_SOURCES) $(PROFILLIC_HMMUNIFYTRANSITIONS_INCS)
$(PROFILLIC_HMMCOPYTRANSITIONS_OBJS): $(PROFILLIC_HMMCOPYTRANSITIONS_SOURCES) $(PROFILLIC_HMMCOPYTRANSITIONS_INCS)

.PHONY: clean
clean:
	rm -f profillic-hmmbuild profillic-hmmtoprofile profillic-hmmcalibrate profillic-hmmunifytransitions profillic-hmmcopytransitions $(PROFILLIC_HMMBUILD_OBJS) $(PROFILLIC_HMMTOPROFILE_OBJS) $(PROFILLIC_HMMCALIBRATE_OBJS) $(PROFILLIC_HMMUNIFYTRANSITIONS_OBJS) $(PROFILLIC_HMMCOPYTRANSITIONS_OBJS)

#========================================
# FILE EXTENSIONS.  Extensions and prefixes for different types of
# files change from platform to platform.  Hide these in macros so
# that we can more easily cut and paste between makefiles.
o		= .o
EXE_SFX		= 
SCRIPT_SFX 	= 
LIB_PFX		= lib
LIB_SFX		= .a
LIB_SHARED_SFX	= .so
TMPLIB		= libtemp.a

# FILE TOOLS
AR 	= ar qv
CHMOD 	= chmod
CP	= cp
GREP	= grep
MKDIR 	= mkdir
MUNCH 	= stepmunch
MV	= mv
NM 	= nm
RANLIB	= ranlib
RM 	= rm -f
RMDIR 	= rm -rf
STRIP	= strip
UNZIP 	= unzip
ZIP 	= zip


#========================================
# ANSI C Compile and Link
#
CC		= gcc
CC_COMPILE	= $(CC) -c $(OPTFLAGS) $(CFLAGS) $(CC_CFLAGS) $(CC_SYSCFLAGS)
CC_LINK		= $(CC) $(LDFLAGS) $(CC_LDFLAGS) $(CC_SYSLDFLAGS) $(CC_LIBS)
CC_CFLAGS 	= $(ALGEBRA_CFLAGS) $(PROLIFIC_CFLAGS) $(BOOST_CFLAGS) $(SEQAN_CFLAGS) $(HMMER3_CFLAGS)
CC_LDFLAGS	= $(ALGEBRA_LDFLAGS) $(PROLIFIC_LDFLAGS) $(BOOST_LDFLAGS) $(SEQAN_LDFLAGS) $(HMMER3_LDFLAGS)
CC_LIBS		= $(ALGEBRA_LIBS) $(PROLIFIC_LIBS) $(BOOST_LIBS) $(SEQAN_LIBS) $(HMMER3_LIBS)

# Global system things used for compilation, static linking, etc.
CC_SYSCFLAGS 	= -I.
CC_SYSLDFLAGS 	=
CC_SYSLIBS	=

#========================================
# C++ Compile and Link
#
CXX		= g++
CXX_COMPILE	= $(CXX) -c  $(OPTFLAGS) $(CFLAGS) $(CXX_CFLAGS) $(CXX_SYSCFLAGS)
CXX_LINK	= $(CXX) $(LDFLAGS) $(CXX_LDFLAGS) $(CXX_SYSLDFLAGS) $(CXX_LIBS)
CXX_CFLAGS 	= $(ALGEBRA_CFLAGS) $(PROLIFIC_CFLAGS) $(BOOST_CFLAGS) $(SEQAN_CFLAGS) $(HMMER3_CFLAGS)
CXX_LDFLAGS	= $(ALGEBRA_LDFLAGS) $(PROLIFIC_LDFLAGS) $(BOOST_LDFLAGS) $(SEQAN_LDFLAGS) $(HMMER3_LDFLAGS)
CXX_LIBS	= $(ALGEBRA_LIBS) $(PROLIFIC_LDFLAGS) $(BOOST_LIBS) $(SEQAN_LIBS) $(HMMER3_LIBS)

# The force flags are used for C/C++ compilers that select the
# language based on the file naming conventions.  Some C++ source
# may be in files with C naming conventions.
CXX_FORCE	= 

# System Flags -- Things for static linking or making sure that the
# compiler understands that a file is a C++ file or whatever.  These
# usually change from platform to platform.
CXX_SYSCFLAGS 	= -I.
CXX_SYSLDFLAGS 	= 
CXX_SYSLIBS	= 

# Compilation Rules -- Repeat the rules for all of the different
# naming conventions.
#
.cxx.o:	; $(CXX_COMPILE) $<
.cpp.o:	; $(CXX_COMPILE) $<
.cc.o:	; $(CXX_COMPILE) $<
.C.o:	; $(CXX_COMPILE) $<

.cxx:	
	$(CXX_COMPILE) $<
	$(CXX_LINK) -o $@ $*.o $(LIBRARIES)
.cpp:	
	$(CXX_COMPILE) $<
	$(CXX_LINK) -o $@ $*.o $(LIBRARIES)
.cc:	
	$(CXX_COMPILE) $<
	$(CXX_LINK) -o $@ $*.o $(LIBRARIES)
.C:	
	$(CXX_COMPILE) $<
	$(CXX_LINK) -o $@ $*.o $(LIBRARIES)

# for legacy reasons also compile .c as c++
.c.o:	; $(CXX_COMPILE) $(CXX_FORCE) $<
.c:	
	$(CXX_COMPILE) $(CXX_FORCE) $<

