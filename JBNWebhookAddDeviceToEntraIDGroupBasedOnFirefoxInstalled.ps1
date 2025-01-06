### PowerShell script to be used to check an application (default 64-bit Mozilla Firefox, but can change variable on line 10 $JBNAppPath to another app.
### Explained in YouTube video from: https://www.youtube.com/@IntuneVitaDoctrina where we create the Webhook URI needed in line 7
### Author: John Bryntze
### Date: 6th January 2024

$JBNparams  = @{  
DeviceName ="$env:COMPUTERNAME"
} 
$JBNwebhookURI = ""
$JBNAppPath = "C:\Program Files\Mozilla Firefox\firefox.exe"

if (test-path -path $JBNAppPath) {
    Write-Host "Firefox is found at $JBNAppPath - add $env:COMPUTERNAME to group"
    # Call the webhook
    $JBNbody = ConvertTo-Json -InputObject $JBNparams  
    $JBNresponse = Invoke-WebRequest -Method Post -Uri $JBNwebhookURI -Body $JBNbody -UseBasicParsing 
} else {
    Write-Host "Firefox is not found at $JBNAppPath. Do not add $env:COMPUTERNAME to group"
} 
