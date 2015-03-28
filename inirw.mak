# Microsoft Developer Studio Generated NMAKE File, Based on inirw.dsp
!IF "$(CFG)" == ""
CFG=inirw - Win32 Debug
!MESSAGE No configuration specified. Defaulting to inirw - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "inirw - Win32 Release" && "$(CFG)" != "inirw - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "inirw.mak" CFG="inirw - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "inirw - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "inirw - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "inirw - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

ALL : "$(OUTDIR)\inirw.exe"


CLEAN :
	-@erase "$(INTDIR)\inirw.obj"
	-@erase "$(INTDIR)\inirw.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\inirw.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /Fp"$(INTDIR)\inirw.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\inirw.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\inirw.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=binmode.obj setargv.obj kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\inirw.pdb" /machine:I386 /out:"$(OUTDIR)\inirw.exe" 
LINK32_OBJS= \
	"$(INTDIR)\inirw.obj" \
	"$(INTDIR)\inirw.res"

"$(OUTDIR)\inirw.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "inirw - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

ALL : "$(OUTDIR)\inirw.exe" "$(OUTDIR)\inirw.bsc"


CLEAN :
	-@erase "$(INTDIR)\inirw.obj"
	-@erase "$(INTDIR)\inirw.res"
	-@erase "$(INTDIR)\inirw.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\inirw.bsc"
	-@erase "$(OUTDIR)\inirw.exe"
	-@erase "$(OUTDIR)\inirw.ilk"
	-@erase "$(OUTDIR)\inirw.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\inirw.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\inirw.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\inirw.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\inirw.sbr"

"$(OUTDIR)\inirw.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=binmode.obj setargv.obj kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\inirw.pdb" /debug /machine:I386 /out:"$(OUTDIR)\inirw.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\inirw.obj" \
	"$(INTDIR)\inirw.res"

"$(OUTDIR)\inirw.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("inirw.dep")
!INCLUDE "inirw.dep"
!ELSE 
!MESSAGE Warning: cannot find "inirw.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "inirw - Win32 Release" || "$(CFG)" == "inirw - Win32 Debug"
SOURCE=.\inirw.cpp

!IF  "$(CFG)" == "inirw - Win32 Release"


"$(INTDIR)\inirw.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "inirw - Win32 Debug"


"$(INTDIR)\inirw.obj"	"$(INTDIR)\inirw.sbr" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\inirw.rc

"$(INTDIR)\inirw.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)



!ENDIF 

