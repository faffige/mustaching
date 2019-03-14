<#
    .SYNOPSIS
        This script is for learning mustache in powershell using nustache
    .DESCRIPTION
        This script is for learning mustache in powershell
    .INPUTS
        None at this time
    .OUTPUTS
        None at this time
    .NOTES
        Version:        1.0
        Author:         faffige
        Creation Date:  12 MAR 19
    .EXAMPLE
        <Example goes here. Repeat this attribute for more than one example>
#>

function Get-RenderedMustache {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(Mandatory=$true,Position=1)]
        [string]$template,
        # Parameter help description
        [Parameter(Mandatory=$true,Position=1)]
        [hashtable]$hash
    )

    begin {
        [Reflection.Assembly]::LoadFile("$PSScriptroot/bin/Nustache.Core.dll") | Out-Null
    }

    process {
        try {
            return [Nustache.Core.Render]::StringToString($template, $hash)
        } catch {
            $_.Exception.Message
        }
    }

    end {

    }
}