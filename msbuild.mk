all:
	MSBuild.exe /nologo inirw.sln /p:Configuration=Debug
	MSBuild.exe /nologo inirw.sln /p:Configuration=Release

clean:
	MSBuild.exe /nologo inirw.sln /p:Configuration=Debug   /t:clean
	MSBuild.exe /nologo inirw.sln /p:Configuration=Release /t:clean

upgrade:
	devenv inirw.sln /upgrade
	
.PHONY:	all clean upgrade


