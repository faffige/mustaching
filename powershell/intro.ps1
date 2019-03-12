<#
    .SYNOPSIS
        <Overview of script>
    .DESCRIPTION
        <Brief description of script>
    .PARAMETER <Parameter_Name>
        <Brief description of parameter input required. Repeat this attribute if required>
    .INPUTS
        <Inputs if any, otherwise state None>
    .OUTPUTS
        <Outputs if any, otherwise state None - example: Log file stored in C:\Windows\Temp\<name>.log>
    .NOTES
        Version:        1.0
        Author:         <Name>
        Creation Date:  <Date>
        Purpose/Change: Initial script development
    
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