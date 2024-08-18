# Compiler and options
CPP=g++
FC=gfortran
TIMER=/usr/bin/time
OPT=
NOPT=-fopenacc $(OPT)
ARGS=1000

# Target for compiling and running the C++ program
c++: jsolvec.exe
	$(TIMER) ./jsolvec.exe $(ARGS)

# Rule for building the C++ executable
jsolvec.exe: jsolvec.cpp
	$(CPP) -o $@ $< $(NOPT)

# Target for compiling and running the Fortran program
fortran: jsolvef.exe
	$(TIMER) ./jsolvef.exe $(ARGS)

# Rule for building the Fortran executable
jsolvef.exe: jsolvef.F90
	$(FC) -o $@ $< $(NOPT)

# Target to build both C++ and Fortran executables
both: c++ fortran

# Clean up generated files
clean:
	rm -f *.o *.exe *.s *.mod a.out
