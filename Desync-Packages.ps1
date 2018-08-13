function Desync-Packages () {
    get-package | group-object Id | %{$versions = ($_.Group | Group-object Version);if(($versions | measure-object).Count -gt 1){$versions;};} | %{$_.Group}
}

Export-ModuleMember -Function 'Desync-Packages'
