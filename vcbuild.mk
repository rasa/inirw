all:
	VCBuild.exe /nologo inirw.vcproj /rebuild

clean:
	VCBuild.exe /nologo inirw.vcproj /clean
	
upgrade:
	devenv inirw.sln /upgrade

.PHONY:	all clean upgrade

