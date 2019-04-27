function Get-Puzzle5Solution {
    <#
        .Synopsis
        Attempts to solve Puzzle5 of IronScripter

        .Description
        Dark Faction released a encoded message using a Caesar Cipher.
        The letters are -5 off from their original letterl.
        This text can be decoded using this cmdlet.

        .Example
        Get-Puzzle5Solution -Path C:\github\2019-PRELUDES\Solutions\Puzzle5Text.txt

        .Notes

    #>
    [cmdletbinding()]
    param(
        # Parameter help description
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $Path
    )

    begin {
        [System.String]$EncodedText = Get-Content $Path
        $ConvertedCharacters = [System.Collections.ArrayList]::new()
    }

    process {
        try {
            foreach ( $Char in $EncodedText.ToCharArray()) {
                $DecodedChar = [char] $($Char - 5)
                [void]$ConvertedCharacters.Add($DecodedChar)
            }
            $DecodedText = -join $ConvertedCharacters
        } catch {
            $PSCmdlet.ThrowTerminatingError( $PSItem )
        }
    }

    end {
        Write-Output "$DecodedText"
    }
}