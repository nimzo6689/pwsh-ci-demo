<#
.SYNOPSIS
To get planet name.

.PARAMETER Name
Planet name. This parameter supports the use of wildcards.
#>
function Get-Planet {
    [CmdletBinding()]
    param (
        [Parameter()][string]$Name = '*'
    )
    $planets = @(
        @{ Name = 'Mercury' }
        @{ Name = 'Venus' }
        @{ Name = 'Earth' }
        @{ Name = 'Mars' }
        @{ Name = 'Jupiter' }
        @{ Name = 'Saturn' }
        @{ Name = 'Uranus' }
        @{ Name = 'Neptune' }
    ) | ForEach-Object { [PSCustomObject] $_ }

    if ($Name -eq 'Pluto') {
        Write-Warning 'In August 2006, Pluto was no longer classified as a planet.'
    }

    $planets | Where-Object { $_.Name -like $Name }
}

Export-ModuleMember -Function Get-Planet
