net localgroup;
net user;
(Get-LocalUser -Name $env:USERNAME).LocalGroup | Select-Object Name
Get-LocalGroupMember -Group "Administrators" #para administradores locais
Get-ADGroupMember -Identity "Domain Admins" #(ou outro nome de grupo) para administradores de domínio
net localgroup administradores werner /add #(adiciona werner ao grupo de administradores)
netplwix (abre caixa dialogo de conta de usuarios)
rundll32.exe PowrProf,SetSuspendState
New-Item -Path .\node -ItemType directory
New-Item -Path .\node\index.js -ItemType file
Set-ExecutionPolicy -ExecuionPolicy RemoteSigned -Scope CurrentUser
Get-ExecutionPolicy
Get-ExecutionPolicy -List
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
 Get-ChildItem -Directory -Recurse | more
Get-ChildItem -Directory -Recurse | Where-Object { $_.Name -match 'python' } | more
Get-ChildItem -Directory -Recurse | Where-Object { $_.Name -match 'python', 'myproject' } | more
Get-ChildItem -Directory -Recurse | Where-Object { $_.FullName -match '^python$' }
Clear-History
Get-History | Where-Object { $_.CommandLine -match "python" }
Get-Process | Where-Object { -not $_.MainWindowTitle }
Get-Process | Where-Object { $_.ProcessName -like "steam*" } # Para visualizar no PowerShell todos os aplicativos da Steam ativos e em segundo plano, você pode filtrar os processos relacionados à Steam. Use o comando abaixo:
Get-Process | Where-Object { $_.ProcessName -like "steam*" -and -not $_.MainWindowTitle } # Esse comando lista todos os processos cujo nome começa com "steam", incluindo o cliente Steam e jogos abertos. Para mostrar apenas os que não têm janela principal (normalmente em segundo plano):
Stop-Process -Name steam* -Force
Start-Process powershell -Verb runAs # rodar como administrador
Start-Process powershell -Verb runAs -WindowStyle Hidden
Move-Item -Path $env:USERPROFILE\Downloads\PIBePIBPerCapita.csv","$env:USERPROFILE\Downloads\PIB_Variacao.csv" -Destination "C:\UFRR\metodosComputacionais"
Move-Item -Path "$env:USERPROFILE\Downloads\*" -Destination "C:\UFRR\metodosComputacionais"
New-Item -Path "c:\ufrr\metodoscomputacionais\1-DadosCSV", "c:\ufrr\metodoscomputacionais\2-DadosImportacao", "c:\ufrr\metodoscomputacionais\3-DadosTratados" -ItemType Directory
Copy-Item -Path "C:\engineer\projects\reiDoFerroVelho/.gitignore" -Destination "..\..\node\projects\zod\"
Copy-Item -Path "C:\engineer\projects\reiDoFerroVelho/gitScript.ps1" -Destination "./"
Remove-Item -Path "c:\ufrr\metodoscomputacionais\pasta1","c:\ufrr\metodoscomputacionais\pasta2","c:\ufrr\metodoscomputacionais\pasta3" -Recurse -Force
"pastaA","pastaB","pastaC" | ForEach-Object { New-Item -Path "c:\ufrr" -Name $_ -ItemType Directory }
Start-Process powershell -Verb runAs -ArgumentList "Get-Process | Where-Object '{$_.ProcessName -like ""*team*"" -and -not $_.MainWindowTitle}' | Stop-Process"
Get-Process | Where-Object {$_.ProcessName -like "*team*" -and -not $_.MainWindowTitle} | Stop-Process -Force
Get-ChildItem -Path C:\ufrr\metodosComputacionais\ -Directory -Filter "pasta*"
Get-ChildItem -Path C:\ufrr\metodosComputacionais\ -Directory -Filter "pasta*" | Remove-Item
----------------------------------------------------------------------
Test-Connection -ComputerName (1..254 | ForEach-Object { "192.168.1.$_" }) -Count 1
Get-NetConnectionProfile (cath the list's perfil of LAN, write donwn (anotate) the number of the InterfaceIndex, and use in the next conmmand bellow. In this case is 16)
Set-NetConnectionProfile -InterfaceIndex 16 -NetworkCategory Private (change domain for private)
Get-ChildItem -File | Where-Object { $_.Name -ne 'App.js' } | Remove-Item
-------------------------------------------
$profile.CurrentUserAllHosts
$profile.AllUsersCurrentHost
$profile.AllUsersAllHosts
-----------------------------------------------
##CRIAR UM PERFIL NO PowerShell
New-Item -Path $PROFILE -ItemType File -force
# Opens PowerShell profile in PowerShell ISE
ISE $PROFILE
---------------------------------------------
#lista detalhada de todos os IDs de eventos de segurança.
wevtutil gp Microsoft-Windows-Security-Auditing /ge /gm:true ()
#consultar eventos de logon e logoff
Get-EventLog -LogName Security | Where-Object { $_.EventID -eq 4624 -or $_.EventID -eq 4634 } | Select-Object TimeGenerated, EntryType, Message | Format-Table -AutoSize
#filtrar por um usuário específico, adicione ao comando acima:
Where-Object { $_.Message -like "*NOME_DO_USUARIO*" }
#logs mais detalhados
Get-WinEvent -LogName Security | Where-Object { $_.Id -eq 4624 -or $_.Id -eq 4634 } | Select-Object TimeCreated, Id, Message | Format-Table -AutoSize
#istar todos os usuários do Windows 11
Get-LocalUser | Select-Object Name, Enabled | Format-Table -AutoSize
#visualizar os grupos de usuários do Windows
Get-LocalGroupMember -Group "Users" | Select-Object Name, ObjectClass | Format-Table -AutoSize
#visualizar dados de um usuário específico
Get-LocalUser "administrador" | Select-Object Name, ObjectClass, enabled | Format-Table -AutoSize;
#Listar todas as funções:
Get-Command -CommandType Function | Select-Object Name, Definition | Format-Table -AutoSize
#Listar todas as variáveis:
Get-Variable | Select-Object Name, Value | Format-Table -AutoSize
get-cimInstance -ClassName Win32_StartupCommand
# para visualizar os processos ativos no Visual Studio Code.
> Developer: Open Process Explorer
