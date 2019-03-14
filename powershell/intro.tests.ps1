. $PSScriptRoot\intro.ps1

Describe 'Get-RenderedMustache' {

    Context 'variables' {

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

    Context 'sections' {

        It 'basic list' {
            $inputString = "@
                Shown.
                {{#person}}
                    Never shown!
                {{/person}}
            @"

            $dictionary = @{
                person = $false
            }

            Get-RenderedMustache -inputString $inputString -dictionary $dictionary |
            Should be "@
                Shown.
            @"
        }
    }
    
    Context 'Lists' {

        
    }   
}