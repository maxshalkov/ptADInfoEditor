function Get-ptIniFile{

    [cmdletbinding()]
    Param(

        [parameter(Mandatory=$true)]
        [string]$FilePath

    )

    Begin{
        $Ini = @{}
    }
    
    Process{
        Get-Content $FilePath | Where-Object {$_ -match "^[^;]"} | ForEach-Object {
            switch ($_){
                {$_ -match "\["} {
                    $Head = $_ -replace "\[|\]" 
                    $Ini[$Head] = @()
                    return
                }

                {$Head -ne $null} {
                    $Ini[$Head] += ,$_
                }
            }
        }
    }

    End{
        return $Ini
    }
}

function New-ptMessageBox{

    [cmdletbinding()]
    Param(

        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$Text,

        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$Head,

        [ValidateSet("Asterisk","Error","Exclamation","Hand","Information","None","Question","Stop","Warning")]
        [parameter(Mandatory=$false)]
        [Windows.Forms.MessageBoxIcon]$Type = "Information",

        [ValidateSet("AbortRetryIgnore","OK","OKCancel","RetryCancel","YesNo","YesNoCancel")]
        [parameter(Mandatory=$false)]
        [Windows.Forms.MessageBoxButtons]$ButtonType = "OK"
    
    )

    Begin{
        Add-Type -AssemblyName System.Windows.Forms
    }

    Process{
        [System.Windows.Forms.MessageBox]::Show($Text, $Head, $ButtonType, $Type)
    }

}