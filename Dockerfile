#FROM mcr.microsoft.com/windows/servercore:ltsc2019
#FROM mcr.microsoft.com/windows/nanoserver:1809
FROM mcr.microsoft.com/powershell:lts-nanoserver-1809-20201013
#Install Chocolatey
RUN powershell.exe -Command Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install Microsoft Visual C++ Redistributable for Visual Studio 2017, URLRewrite Module and SQL Server CMD Utilities (BCP)
#RUN choco.exe install vcredist140 -y 
#RUN choco.exe install sql2012.nativeclient -y

#RUN choco.exe install vim -y
RUN choco.exe install nodejs --version=7.9.0 -y 

WORKDIR c:/home/site/wwwroot

COPY . c:/home/site/wwwroot


EXPOSE 80

CMD ["node", "index.js"]


