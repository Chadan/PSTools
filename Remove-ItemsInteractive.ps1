param (

)

Write-Host -ForegroundColor Cyan -Value @"
This utily deletes any folder or file you copy to it.
WARNING: This utility will remove the items specified without asking for confirmation, so be careful.

Insert a path per line.
:Q to quit

"@

$TextLine = (Read-Host).Trim()
$ErrorMsg = ""

While ($TextLine -ne ":Q" `
       -and $TextLine -ne ":q") {
    If ($TextLine.Length -gt 0) {
        Write-Host "`t$($TextLine): " -ForegroundColor Yellow -NoNewline
    
        Remove-Item -Path $TextLine -Force -Recurse -ErrorAction SilentlyContinue
        If ($? -eq $true) {
            Write-Host "SUCESS" -ForegroundColor Green
        }
        Else {
            Write-Host "FAIL -> $($Error[0].Exception.Message)" -ForegroundColor Red
        }
    }

    $TextLine = (Read-Host).Trim()
}
