Connect-AzAccount


# Générer un certificat auto-signé pour servir de CA (si nécessaire)
$cert = New-SelfSignedCertificate `
    -Subject "CN=MyCertAuthority" `
    -CertStoreLocation "cert:\CurrentUser\My" `
    -Type Custom `
    -KeySpec Signature `
    -KeyLength 2048 `
    -KeyExportPolicy Exportable `
    -HashAlgorithm sha256 `
    -KeyUsage CertSign `
    -KeyUsageProperty Sign

# Utiliser le certificat précédent comme Signer pour créer un certificat client
New-SelfSignedCertificate `
    -DnsName "myCertClient" `
    -Subject "CN=myCert" `
    -CertStoreLocation "cert:\CurrentUser\My" `
    -Type Custom `
    -KeySpec Signature `
    -KeyLength 2048 `
    -KeyExportPolicy Exportable `
    -HashAlgorithm sha256 `
    -Signer $cert `
    -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.2")

# suppression du certificat
Get-ChildItem -Path cert:\CurrentUser\My | Where-Object { $_.Subject -eq "CN=myCert" }
$cert = Get-ChildItem -Path cert:\CurrentUser\My | Where-Object { $_.Subject -eq "CN=myCert" }
Remove-Item -Path $cert.PSPath
    