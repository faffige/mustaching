<#
    .SYNOPSIS
        This script is for learning mustache in powershell
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

$path = $pwd.Path

[Reflection.Assembly]::LoadFile("$path/powershell/bin/Nustache.Core.dll") | Out-Null

$InputString = 'Hello {{person}}!'
$dictionary = @{
    person = 'World'
}

try{
    return [Nustache.Core.Render]::StringToString($InputString, $dictionary)
} catch [Exception] {
    $_.Exception.Message
}