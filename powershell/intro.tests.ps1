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

        It 'basic section' {
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
        It 'basic list' {
            $inputString = "@
            {{#repo}}
                <b>{{name}}</b>
            {{/repo}}
            @"

            $dictionary = @{
                repo = @(
                    @{name = "John"},
                    @{name = "Toby"},
                    @{name = "Jane"}
                )
            }

            Get-RenderedMustache -inputString $inputString -dictionary $dictionary |
            Should be "@
                <b>John</b>
                <b>Toby</b>
                <b>Jane</b>
            @"
        }
    }
}