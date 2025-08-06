$date = Get-Date -Format "d MMM yyyy hh:mm:ss"
Write-Output "Setting date to `"$date`""
$command = "sudo date --set \`"$date\`""
Write-Output statsaregood | clip
ssh pi@scoreboard1 "$command"
ssh pi@scoreboard2 "$command"
