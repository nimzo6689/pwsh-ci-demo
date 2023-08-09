Import-Module $PSScriptRoot\..\PwshCIDemo\PwshCIDemo.psd1 -Force

Describe 'Get-Planet' {

    It 'Given no parameters, it lists all 8 planets' {
        $planets = Get-Planet
        $planets.Count | Should -Be 8
    }

    It 'Given Pluto as an parameter, the number of planets is zero, and a warning message is displayed.' {
        $planets = Get-Planet -Name 'Pluto' -WarningVariable logging -WarningAction Continue
        $planets.Count | Should -Be 0
        $logging.Message | Should -Be 'In August 2006, Pluto was no longer classified as a planet.'
    }
}
