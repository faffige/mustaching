. $PSScriptRoot\intro.ps1

Describe 'Get-RenderedMustache' {

    Context 'variables' {

        It 'basic render' {
            $template = 'Hello {{person}}!'
            $hash = @{
                person = 'World'
            }
            Get-RenderedMustache -template $template -hash $hash |
            Should be 'Hello World!'
        }

        It 'complex render' {
            $template = "@
                Hello {{person}}, are you having a good {{expression}}?
            @"

            $hash = @{
                person = 'John'
                expression = 'day'
            }

            Get-RenderedMustache -template $template -hash $hash |
            Should be "@
                Hello John, are you having a good day?
            @"
        }
    }

    Context 'sections' {

        It 'basic section' {
            $template = "@
                Shown.
                {{#person}}
                    Never shown!
                {{/person}}
            @"

            $hash = @{
                person = $false
            }

            Get-RenderedMustache -template $template -hash $hash |
            Should be "@
                Shown.
            @"
        }
    }

    Context 'Lists' {
        It 'basic list' {
            $template = "@
            {{#repo}}
                <b>{{name}}</b>
            {{/repo}}
            @"

            $hash = @{
                repo = @(
                    @{name = "John"},
                    @{name = "Toby"},
                    @{name = "Jane"}
                )
            }

            Get-RenderedMustache -template $template -hash $hash |
            Should be "@
                <b>John</b>
                <b>Toby</b>
                <b>Jane</b>
            @"
        }
    }
}