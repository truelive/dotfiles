if ( -Not (Test-Path -Path "$Env:userprofile\dotfiles\win")) {
    White-Host "Can not find dotfiles repo in $Env:userprofile"
    exit 1
}
if ( -Not (Test-Path -Path "$Env:userprofile\bin")) {
    New-Item -ItemType Junction -Path "$Env:USERPROFILE\bin" -Target "$Env:USERPROFILE\dotfiles\win\bin"
} else {
    Write-Warning "[$Env:USERPROFILE\bin] is already exists. can't create junction"
    exit 1
}


Invoke-WebRequest -Uri "https://www.7-zip.org/a/7zr.exe" -OutFile "$Env:USERPROFILE\bin\7zr.exe"
Invoke-WebRequest -Uri "https://www.7-zip.org/a/7z2406-x64.exe" -OutFile "$Env:USERPROFILE\bin\7zins.exe"
.\7zr x -o7zip 7zins.exe 
New-Item -ItemType HardLink -Path "$Env:USERPROFILE\bin\7z.exe"  -Target "$Env:USERPROFILE\bin\7zip\7z.exe"
Remove-Item "$Env:USERPROFILE\bin\7zins.exe" 

Invoke-WebRequest -Uri "https://cygwin.com/setup-x86_64.exe" -OutFile "$Env:USERPROFILE\bin\cyqwinins.exe"
# RUN AS ELEVATED
# .\cyqwinins.exe -R cygwin -n -v -D -q

$just_link = Invoke-WebRequest -Uri https://api.github.com/repos/casey/just/releases/latest | ConvertFrom-Json | Select-Object -ExpandProperty assets | Where-Object -Property browser_download_url -Match "just-[1-9.]*-x86_64-pc-windows-msvc.zip"
Invoke-WebRequest -Uri $just_link.browser_download_url -OutFile "$Env:USERPROFILE\bin\just.zip"
Expand-Archive "$Env:USERPROFILE\bin\just.zip" -DestinationPath "$Env:USERPROFILE\bin\just"
New-Item -ItemType HardLink -Path "$Env:USERPROFILE\bin\just.exe"  -Target "$Env:USERPROFILE\bin\just\just.exe"
Remove-Item "$Env:USERPROFILE\bin\just.zip" 


$zstd_link = Invoke-WebRequest -Uri https://api.github.com/repos/facebook/zstd/releases/latest | ConvertFrom-Json | Select-Object -ExpandProperty assets | Where-Object -Property browser_download_url -Match "-win64.zip$"
Invoke-WebRequest -Uri $zstd_link.browser_download_url -OutFile "$Env:USERPROFILE\bin\zstd.zip"
Expand-Archive "$Env:USERPROFILE\bin\zstd.zip" -DestinationPath "$Env:USERPROFILE\bin\zstd"
$zstd_path = Get-Childitem -Path "$Env:userprofile\bin\zstd\*\zstd.exe" -Recurse | Select-Object FullName
New-Item -ItemType HardLink -Path "$Env:USERPROFILE\bin\zstd.exe"  -Target "$zstd_path"
Remove-Item "$Env:USERPROFILE\bin\zstd.zip" 


$msys2_link = Invoke-WebRequest -Uri https://api.github.com/repos/msys2/msys2-installer/releases/latest | ConvertFrom-Json | Select-Object -ExpandProperty assets | Where-Object -Property browser_download_url -Match "tar.zst$"
Invoke-WebRequest -Uri $msys2_link.browser_download_url -OutFile "$Env:USERPROFILE\bin\msys2.tar.zst"
./zstd -d "$Env:USERPROFILE\bin\msys2.tar.zst" -o "$Env:USERPROFILE\bin\msys2.tar"
.\7z\7za.exe x -omsys2 .\msys2.tar
Remove-Item "$Env:USERPROFILE\bin\msys2.tar.zst" 
Remove-Item "$Env:USERPROFILE\bin\msys2.tar" 
