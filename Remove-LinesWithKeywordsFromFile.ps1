param (
    [string]$File,
    [string]$KeywordsFile,
    [string]$OutFile,
    $Encoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::UTF8
)

$FileContent = Get-Content $File -Encoding $Encoding
$Keywords = Get-Content $KeywordsFile

$OutFileContent = New-Object System.Text.StringBuilder
#Iterate through all lines and only re-add the ones that doesn't contain any keyword.
ForEach ($TextLine in $FileContent) {
    $IsKeywordPresent = $false
    ForEach ($Keyword in $Keywords) {
        If ($TextLine.Contains($Keyword)) {
            $IsKeywordPresent = $true
        }
    }

    If (-Not $IsKeywordPresent) {
        $OutFileContent.AppendLine($TextLine)
    }
}

Set-Content -Path $OutFile -Value $OutFileContent.ToString() -Encoding $Encoding

