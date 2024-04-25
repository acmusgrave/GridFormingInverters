
#------------------------------------------------------------------------------
# Project 'Droop_Weak_Intertie' make using the 'GFortran 4.6.2' compiler.
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# All project
#------------------------------------------------------------------------------

all: targets
	@echo !--Make: succeeded.



#------------------------------------------------------------------------------
# Directories, Platform, and Version
#------------------------------------------------------------------------------

Arch        = windows
EmtdcDir    = C:\Program Files (x86)\PSCAD50\emtdc\gf46
EmtdcInc    = $(EmtdcDir)\inc
EmtdcBin    = $(EmtdcDir)\$(Arch)
EmtdcMain   = $(EmtdcBin)\main.obj
EmtdcLib    = $(EmtdcBin)\emtdc.lib
SolverLib    = $(EmtdcBin)\Solver.lib


#------------------------------------------------------------------------------
# Fortran Compiler
#------------------------------------------------------------------------------

FC_Name         = gfortran.exe
FC_Suffix       = o
FC_Args         = -c -ffree-form -fdefault-real-8 -fdefault-double-8
FC_Debug        = -O2
FC_Preprocess   = 
FC_Preproswitch = 
FC_Warn         = -Wconversion
FC_Checks       = 
FC_Includes     = -I"$(EmtdcInc)" -I"$(EmtdcBin)"
FC_Compile      = $(FC_Name) $(FC_Args) $(FC_Includes) $(FC_Debug) $(FC_Warn) $(FC_Checks)

#------------------------------------------------------------------------------
# C Compiler
#------------------------------------------------------------------------------

CC_Name     = gcc.exe
CC_Suffix   = o
CC_Args     = -c
CC_Debug    = -O2
CC_Includes = -I"$(EmtdcInc)" -I"$(EmtdcBin)"
CC_Compile  = $(CC_Name) $(CC_Args) $(CC_Includes) $(CC_Debug)

#------------------------------------------------------------------------------
# Linker
#------------------------------------------------------------------------------

Link_Name   = gcc.exe
Link_Debug  = -O2
Link_Args   = -o $@
Link        = $(Link_Name) $(Link_Args) $(Link_Debug)

#------------------------------------------------------------------------------
# Build rules for generated files
#------------------------------------------------------------------------------


%.$(FC_Suffix): %.f
	@echo !--Compile: $<
	$(FC_Compile) $<


%.$(CC_Suffix): %.c
	@echo !--Compile: $<
	$(CC_Compile) $<



#------------------------------------------------------------------------------
# Build rules for file references
#------------------------------------------------------------------------------


#------------------------------------------------------------------------------
# Dependencies
#------------------------------------------------------------------------------


FC_Objects = \
 DS.$(FC_Suffix) \
 Main.$(FC_Suffix) \
 PVFarm_GFL_GFM_2_1.$(FC_Suffix) \
 SimpleSF_15_2_1.$(FC_Suffix) \
 Control_12_2_1_1_1_1.$(FC_Suffix) \
 EPRI_PLL_22_2_1_1_1_1.$(FC_Suffix) \
 PI_AntiWindUp_50_2_1.$(FC_Suffix) \
 Untitled_3.$(FC_Suffix)

FC_ObjectsLong = \
 "DS.$(FC_Suffix)" \
 "Main.$(FC_Suffix)" \
 "PVFarm_GFL_GFM_2_1.$(FC_Suffix)" \
 "SimpleSF_15_2_1.$(FC_Suffix)" \
 "Control_12_2_1_1_1_1.$(FC_Suffix)" \
 "EPRI_PLL_22_2_1_1_1_1.$(FC_Suffix)" \
 "PI_AntiWindUp_50_2_1.$(FC_Suffix)" \
 "Untitled_3.$(FC_Suffix)"

CC_Objects =

CC_ObjectsLong =

LK_Objects =

LK_ObjectsLong =

SysLibs  = -lgfortran -lstdc++ -lquadmath -lwsock32

Binary   = Droop_Weak_Intertie.exe

$(Binary): $(FC_Objects) $(CC_Objects) $(LK_Objects) 
	@echo !--Link: $@
	$(Link) "$(EmtdcMain)" $(FC_ObjectsLong) $(CC_ObjectsLong) $(LK_ObjectsLong) "$(EmtdcLib)" "$(SolverLib)" $(SysLibs)

targets: $(Binary)


clean:
	-del EMTDC_V*
	-del *.obj
	-del *.o
	-del *.exe
	@echo !--Make clean: succeeded.



