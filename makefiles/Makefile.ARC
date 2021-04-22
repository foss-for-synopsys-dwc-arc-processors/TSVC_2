PREFIX ?= arc64-elf-

CC  = $(PREFIX)gcc $(ARCH)
CXX = $(PREFIX)g++ $(ARCH)
FC  = $(PREFIX)gfortran $(ARCH)
flags = -O3 -fstrict-aliasing -fivopts -munaligned-access -m128 -mwide \
       	-save-temps
vecflags = -ftree-vectorize -msimd -mfpu=fpud
novecflags = -fno-tree-vectorize
omp_flags=-fopenmp

# GCC allows only one output for -fopt-info option.
# -fopt-info-vec=gcc$(SUFFIX).vect-fopt-info-vec=gcc$(SUFFIX).vect
ifdef VEC_REPORT
vecflags+=-ftree-vectorizer-verbose=1  \
	-fopt-info-vec-missed=gcc$(SUFFIX).miss -fno-inline
endif

ieee_math_flags=
fast_math_flags=-ffast-math

ifdef PRECISE_MATH
$(warning No 'precise' math flags for GNU!)
endif

