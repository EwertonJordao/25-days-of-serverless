using namespace System.Net
# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)
# Write to the Azure Functions log stream.
Write-Host "PowerShell in 25daysofserverless Day 1"
$Hanukkah = @(
    "נ (Nun)",
    "ג (Gimmel)",
    "ה (Hay)",
    "ש (Shin)"
)
$dice = New-Object PSCustomObject @{
    Val = (Get-Random $Hanukkah -Minimum 0)
}
$status = [HttpStatusCode]::OK
$body = ($dice | ConvertTo-Json)           

Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
        headers    = @{'content-type' = 'application/json'; "charset" = "utf-8" }
        StatusCode = $status
        Body       = $body
    })
