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

    It 'complex render' {
        $inputString = "@
            Hello {{person}}, are you having a good {{expression}}?
        @"
        $dictionary = @{
            person = 'John'
            expression = 'day'
        }
        Get-RenderedMustache -inputString $inputString -dictionary $dictionary |
        Should be "@
            Hello John, are you having a good day?
        @"
    }
}