#FROM mcr.microsoft.com/windows/servercore:ltsc2019
#FROM mcr.microsoft.com/windows/servercore:2004
#FROM mcr.microsoft.com/windows/nanoserver:1809
#FROM mcr.microsoft.com/powershell:lts-nanoserver-1809-20201013
FROM ubuntu
#Install Chocolatey for test
RUN powershell.exe -Command Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))


#RUN choco.exe install vim -y
RUN choco.exe install nodejs --version=12.18.0 -y 

WORKDIR c:/home/site/wwwroot

COPY . c:/home/site/wwwroot


EXPOSE 80

CMD ["node", "index.js"]


