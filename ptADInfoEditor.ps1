Clear-Host

#Requires -Version 5.0

Data LocalizedData{ 
    # culture = "ru-RU" 
    ConvertFrom-StringData @' 
        TestError        = __pt: Тестовая ошибка. 
        FailedImportFunc = __pt: Ошибка при импорте функции {0}"
'@ 
} 

Try{
    . "$PSScriptRoot\New-ptMessageBox.ps1"
} 

Catch{
    throw "1"
}
<#
if (-not (Test-Path $PSScriptRoot\Properties.ini)){
    throw "__pt: File property not found"
}
#>