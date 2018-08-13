@echo off  
reg add "HKCR\*\shell\ms-dos" /ve /d MS-DOS /f  
reg add "HKCR\*\shell\ms-dos\command" /ve /d "cmd.exe /k cd %%1" /f  
reg add "HKCR\Folder\shell\ms-dos" /ve /d MS-DOS /f  
reg add "HKCR\Folder\shell\ms-dos\command" /ve /d "cmd.exe /k cd %%1" /f  
reg add "HKCR\Directory\Background\shell\ms-dos" /ve /d MS-DOS /f  
reg add "HKCR\Directory\Background\shell\ms-dos\command" /ve /d "cmd.exe" /f  
