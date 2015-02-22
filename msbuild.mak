.PHONY:	all clean realclean

all:
	MSBuild.exe inirw.sln /t:Build /p:Configuration=Debug
	MSBuild.exe inirw.sln /t:Build /p:Configuration=Release

clean:
	MSBuild.exe inirw.sln /t:Clean /p:Configuration=Debug
	MSBuild.exe inirw.sln /t:Clean /p:Configuration=Release

realclean: clean
	-cmd /c del /s *.bak *.bsc *.idb *.pdb *.lib *.ncb *.obj *.opt *.pch *.plg *.sbr