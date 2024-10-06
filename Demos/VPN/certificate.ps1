# Connect-AzAccount


# Générer un certificat auto-signé pour servir de CA (si nécessaire)
$cert = New-SelfSignedCertificate `
    -Subject "CN=AmethysteCertAuthority" `
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
    -DnsName "amethysteCertClient" `
    -Subject "CN=amethysteCert" `
    -CertStoreLocation "cert:\CurrentUser\My" `
    -Type Custom `
    -KeySpec Signature `
    -KeyLength 2048 `
    -KeyExportPolicy Exportable `
    -HashAlgorithm sha256 `
    -Signer $cert `
    -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.2")


# suppression du certificat CA
# $certCA = Get-ChildItem -Path Cert:\CurrentUser\My | Where-Object { $_.Subject -like "CN=AmethysteCertAuthority" }
# Remove-Item -Path "Cert:\CurrentUser\My\$($certCA.Thumbprint)"

# supprimer le certificat client
# $certClient = Get-ChildItem -Path Cert:\CurrentUser\My | Where-Object { $_.Subject -like "CN=amethysteCert" }
# Remove-Item -Path "Cert:\CurrentUser\My\$($certClient.Thumbprint)"
