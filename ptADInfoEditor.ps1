#Requires -Version 5.0
$Properties = Join-Path -Path $PSScriptRoot -ChildPath "Properties.ini"
$Resources  = Join-Path -Path $PSScriptRoot -ChildPath "Resources.ps1"

Data LocalizedData{ 
    # culture = "ru-RU" 
    ConvertFrom-StringData @' 
        FailedImportFunctionsFile = __pt: Ошибка загрузки ресурсного файла
        IniFileNotFound           = __pt: Ini-файл не найден
'@ 
} 

Try{
    . $Resources
} 
Catch{
    throw $LocalizedData.FailedImportFunc
}

if (-not (Test-Path $Properties)){
    throw $LocalizedData.IniNotFound
}

Clear-Host
