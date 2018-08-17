function Desync-Packages () {
    get-package | group-object Id | %{$versions = ($_.Group | Group-object Version);if(($versions | measure-object).Count -gt 1){$versions;};} | %{$_.Group}
}

function Branch-Packages () {
    get-package | group-object Id | %{$versions = ($_.Group | Group-object Version);if(($versions.Name -match '[a-zA-Z]')) { $versions; };} | %{$_.Group}
}

Export-ModuleMember -Function 'Desync-Packages'
Export-ModuleMember -Function 'Branch-Packages'