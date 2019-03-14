. .\intro.ps1

Describe 'Get-RenderedMustache' {

    It 'basic render' {
        $inputString = 'Hello {{person}}!'
        $dictionary = @{
            person = 'World'
        }
        Get-RenderedMustache -inputString $inputString -dictionary $dictionary |
        Should be 'Hello World!'
    }
}