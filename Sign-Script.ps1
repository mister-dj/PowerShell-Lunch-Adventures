<#
Code signing script written by Don Morgan 8-19-18

#>

#create function for a file dialog box
Function Get-FileName($initialDirectory){   
 [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null

 $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
 $OpenFileDialog.initialDirectory = $initialDirectory
 $OpenFileDialog.filter = "All files (*.*)| *.*"
 $OpenFileDialog.ShowDialog() | Out-Null
 $OpenFileDialog.filename
} #end function Get-FileName

#get the script to sign
$script = Get-FileName C:

#automagically get the certificate for code signing
$cert=(dir cert:currentuser\my\ -CodeSigningCert)

#sign the script
Set-AuthenticodeSignature $script $cert -Timestampserver http://timestamp.comodoca.com/authenticode 


# SIG # Begin signature block
# MIIdAgYJKoZIhvcNAQcCoIIc8zCCHO8CAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQU65EIh2sGCOR7BwtU2Qytta+U
# B5mgghYJMIIG7DCCBNSgAwIBAgIQMA9vrN1mmHR8qUY2p3gtuTANBgkqhkiG9w0B
# AQwFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNV
# BAcTC0plcnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsx
# LjAsBgNVBAMTJVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkw
# HhcNMTkwNTAyMDAwMDAwWhcNMzgwMTE4MjM1OTU5WjB9MQswCQYDVQQGEwJHQjEb
# MBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgw
# FgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxJTAjBgNVBAMTHFNlY3RpZ28gUlNBIFRp
# bWUgU3RhbXBpbmcgQ0EwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDI
# GwGv2Sx+iJl9AZg/IJC9nIAhVJO5z6A+U++zWsB21hoEpc5Hg7XrxMxJNMvzRWW5
# +adkFiYJ+9UyUnkuyWPCE5u2hj8BBZJmbyGr1XEQeYf0RirNxFrJ29ddSU1yVg/c
# yeNTmDoqHvzOWEnTv/M5u7mkI0Ks0BXDf56iXNc48RaycNOjxN+zxXKsLgp3/A2U
# Urf8H5VzJD0BKLwPDU+zkQGObp0ndVXRFzs0IXuXAZSvf4DP0REKV4TJf1bgvUac
# gr6Unb+0ILBgfrhN9Q0/29DqhYyKVnHRLZRMyIw80xSinL0m/9NTIMdgaZtYClT0
# Bef9Maz5yIUXx7gpGaQpL0bj3duRX58/Nj4OMGcrRrc1r5a+2kxgzKi7nw0U1BjE
# MJh0giHPYla1IXMSHv2qyghYh3ekFesZVf/QOVQtJu5FGjpvzdeE8NfwKMVPZIMC
# 1Pvi3vG8Aij0bdonigbSlofe6GsO8Ft96XZpkyAcSpcsdxkrk5WYnJee647BeFbG
# RCXfBhKaBi2fA179g6JTZ8qx+o2hZMmIklnLqEbAyfKm/31X2xJ2+opBJNQb/HKl
# FKLUrUMcpEmLQTkUAx4p+hulIq6lw02C0I3aa7fb9xhAV3PwcaP7Sn1FNsH3jYL6
# uckNU4B9+rY5WDLvbxhQiddPnTO9GrWdod6VQXqngwIDAQABo4IBWjCCAVYwHwYD
# VR0jBBgwFoAUU3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFBqh+GEZIA/D
# QXdFKI7RNV8GEgRVMA4GA1UdDwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEA
# MBMGA1UdJQQMMAoGCCsGAQUFBwMIMBEGA1UdIAQKMAgwBgYEVR0gADBQBgNVHR8E
# STBHMEWgQ6BBhj9odHRwOi8vY3JsLnVzZXJ0cnVzdC5jb20vVVNFUlRydXN0UlNB
# Q2VydGlmaWNhdGlvbkF1dGhvcml0eS5jcmwwdgYIKwYBBQUHAQEEajBoMD8GCCsG
# AQUFBzAChjNodHRwOi8vY3J0LnVzZXJ0cnVzdC5jb20vVVNFUlRydXN0UlNBQWRk
# VHJ1c3RDQS5jcnQwJQYIKwYBBQUHMAGGGWh0dHA6Ly9vY3NwLnVzZXJ0cnVzdC5j
# b20wDQYJKoZIhvcNAQEMBQADggIBAG1UgaUzXRbhtVOBkXXfA3oyCy0lhBGysNsq
# fSoF9bw7J/RaoLlJWZApbGHLtVDb4n35nwDvQMOt0+LkVvlYQc/xQuUQff+wdB+P
# xlwJ+TNe6qAcJlhc87QRD9XVw+K81Vh4v0h24URnbY+wQxAPjeT5OGK/EwHFhaNM
# xcyyUzCVpNb0llYIuM1cfwGWvnJSajtCN3wWeDmTk5SbsdyybUFtZ83Jb5A9f0Vy
# wRsj1sJVhGbks8VmBvbz1kteraMrQoohkv6ob1olcGKBc2NeoLvY3NdK0z2vgwY4
# Eh0khy3k/ALWPncEvAQ2ted3y5wujSMYuaPCRx3wXdahc1cFaJqnyTdlHb7qvNhC
# g0MFpYumCf/RoZSmTqo9CfUFbLfSZFrYKiLCS53xOV5M3kg9mzSWmglfjv33sVKR
# zj+J9hyhtal1H3G/W0NdZT1QgW6r8NDT/LKzH7aZlib0PHmLXGTMze4nmuWgwAxy
# h8FuTVrTHurwROYybxzrF06Uw3hlIDsPQaof6aFBnf6xuKBlKjTg3qj5PObBMLvA
# oGMs/FwWAKjQxH/qEZ0eBsambTJdtDgJK0kHqv3sMNrxpy/Pt/360KOE2See+wFm
# d7lWEOEgbsausfm2usg1XTN2jvF8IAwqd661ogKGuinutFoAsYyr4/kKyVRd1Llq
# dJ69SK6YMIIHBzCCBO+gAwIBAgIRAIx3oACP9NGwxj2fOkiDjWswDQYJKoZIhvcN
# AQEMBQAwfTELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3Rl
# cjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSUw
# IwYDVQQDExxTZWN0aWdvIFJTQSBUaW1lIFN0YW1waW5nIENBMB4XDTIwMTAyMzAw
# MDAwMFoXDTMyMDEyMjIzNTk1OVowgYQxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJH
# cmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGDAWBgNVBAoTD1Nl
# Y3RpZ28gTGltaXRlZDEsMCoGA1UEAwwjU2VjdGlnbyBSU0EgVGltZSBTdGFtcGlu
# ZyBTaWduZXIgIzIwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCRh0ss
# i8HxHqCe0wfGAcpSsL55eV0JZgYtLzV9u8D7J9pCalkbJUzq70DWmn4yyGqBfbRc
# PlYQgTU6IjaM+/ggKYesdNAbYrw/ZIcCX+/FgO8GHNxeTpOHuJreTAdOhcxwxQ17
# 7MPZ45fpyxnbVkVs7ksgbMk+bP3wm/Eo+JGZqvxawZqCIDq37+fWuCVJwjkbh4E5
# y8O3Os2fUAQfGpmkgAJNHQWoVdNtUoCD5m5IpV/BiVhgiu/xrM2HYxiOdMuEh0Fp
# Y4G89h+qfNfBQc6tq3aLIIDULZUHjcf1CxcemuXWmWlRx06mnSlv53mTDTJjU67M
# ximKIMFgxvICLMT5yCLf+SeCoYNRwrzJghohhLKXvNSvRByWgiKVKoVUrvH9Pkl0
# dPyOrj+lcvTDWgGqUKWLdpUbZuvv2t+ULtka60wnfUwF9/gjXcRXyCYFevyBI19U
# CTgqYtWqyt/tz1OrH/ZEnNWZWcVWZFv3jlIPZvyYP0QGE2Ru6eEVYFClsezPuOjJ
# C77FhPfdCp3avClsPVbtv3hntlvIXhQcua+ELXei9zmVN29OfxzGPATWMcV+7z3o
# UX5xrSR0Gyzc+Xyq78J2SWhi1Yv1A9++fY4PNnVGW5N2xIPugr4srjcS8bxWw+St
# Q8O3ZpZelDL6oPariVD6zqDzCIEa0USnzPe4MQIDAQABo4IBeDCCAXQwHwYDVR0j
# BBgwFoAUGqH4YRkgD8NBd0UojtE1XwYSBFUwHQYDVR0OBBYEFGl1N3u7nTVCTr9X
# 05rbnwHRrt7QMA4GA1UdDwEB/wQEAwIGwDAMBgNVHRMBAf8EAjAAMBYGA1UdJQEB
# /wQMMAoGCCsGAQUFBwMIMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQMIMCUwIwYI
# KwYBBQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMEQGA1UdHwQ9MDswOaA3
# oDWGM2h0dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQVRpbWVTdGFtcGlu
# Z0NBLmNybDB0BggrBgEFBQcBAQRoMGYwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQu
# c2VjdGlnby5jb20vU2VjdGlnb1JTQVRpbWVTdGFtcGluZ0NBLmNydDAjBggrBgEF
# BQcwAYYXaHR0cDovL29jc3Auc2VjdGlnby5jb20wDQYJKoZIhvcNAQEMBQADggIB
# AEoDeJBCM+x7GoMJNjOYVbudQAYwa0Vq8ZQOGVD/WyVeO+E5xFu66ZWQNze93/tk
# 7OWCt5XMV1VwS070qIfdIoWmV7u4ISfUoCoxlIoHIZ6Kvaca9QIVy0RQmYzsProD
# d6aCApDCLpOpviE0dWO54C0PzwE3y42i+rhamq6hep4TkxlVjwmQLt/qiBcW62nW
# 4SW9RQiXgNdUIChPynuzs6XSALBgNGXE48XDpeS6hap6adt1pD55aJo2i0OuNtRh
# cjwOhWINoF5w22QvAcfBoccklKOyPG6yXqLQ+qjRuCUcFubA1X9oGsRlKTUqLYi8
# 6q501oLnwIi44U948FzKwEBcwp/VMhws2jysNvcGUpqjQDAXsCkWmcmqt4hJ9+gL
# JTO1P22vn18KVt8SscPuzpF36CAT6Vwkx+pEC0rmE4QcTesNtbiGoDCni6GftCzM
# wBYjyZHlQgNLgM7kTeYqAT7AXoWgJKEXQNXb2+eYEKTx6hkbgFT6R4nomIGpdcAO
# 39BolHmhoJ6OtrdCZsvZ2WsvTdjePjIeIOTsnE1CjZ3HM5mCN0TUJikmQI54L7nu
# +i/x8Y/+ULh43RSW3hwOcLAqhWqxbGjpKuQQK24h/dN8nTfkKgbWw/HXaONPB3mB
# CBP+smRe6bE85tB4I7IJLOImYr87qZdRzMdEMoGyr8/fMIIICjCCBfKgAwIBAgIT
# agAAABI1F/AkHSynUwAAAAAAEjANBgkqhkiG9w0BAQsFADBbMRMwEQYKCZImiZPy
# LGQBGRYDbmV0MRkwFwYKCZImiZPyLGQBGRYJZG9ubW9yZ2FuMRIwEAYKCZImiZPy
# LGQBGRYCYWQxFTATBgNVBAMTDGFkLURDQ0EwMS1DQTAeFw0yMjAzMjAxNzU4MzJa
# Fw0yNDAzMjAxODA4MzJaMIGIMRMwEQYKCZImiZPyLGQBGRYDbmV0MRkwFwYKCZIm
# iZPyLGQBGRYJZG9ubW9yZ2FuMRIwEAYKCZImiZPyLGQBGRYCYWQxDjAMBgNVBAsT
# BURNTkVUMRUwEwYDVQQLEwxEb21haW4gVXNlcnMxGzAZBgNVBAMTEkRvbiBNb3Jn
# YW4gKEFkbWluKTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALh8p7Jh
# qkWgwXKi9mUNjWxeXXdJOXP785ZWQ6wpEK7w90XAcMWOqVAVURnBSiYTBjgj9Pt3
# WkmWqDFXB0D34teFXJNRJOEF2Mz+mIYOH/47+FCkxXD6siwKOFu1qQe5mioWp0Bw
# iMdBFevFTH54F70OTLObA2Ox+ZAIdqAL1MtIcq+RW+w1H9RhKNm+7toIkGN9ChXo
# aqTowmTR24FI5N/izpskrKAQoQ25nhdfNMCwQd2rEqCN2JeTAa3xyPsXITDuFWg6
# 2NmMHqBQLYws0m32jHc+gyoYf4LGU9SjFmGJRqiWjMo2YBe3hLqAeNeN5WOPPjbj
# 0EMSFoTDp8SkJb75MfKM23xv0SZ45uqPhgbQdurQXdJcA27YnHjru+Abke58th3s
# OcEivAw3e1v9AnOduDWrUmsTqg8cgQTOC4FU+3SmMGFDHyvL/j75CtFM+fjFK5mV
# ihrjaFcMooXRgKRkHDwb7SXW5D1kauJUOeRoL4Mb0ML5uyi7mLK3vuXBWraMQXre
# 0o5IJrn0HgIRE2iXJzvjUkEWug3BP8zOeOOQiTqllRYuB3qrSBCZCkacbh+i2Ylu
# uExpDiRT3RUq9DEfeyi3yOlItknlY9LNaRot4UI9mEMcBs/f8thlG+1oT4PxRZ94
# nqMf+WCiBCzIMmcAd6a67BcqlyI3zLVhipEhAgMBAAGjggKXMIICkzA9BgkrBgEE
# AYI3FQcEMDAuBiYrBgEEAYI3FQiCz7V+gce2SvmdEoHPyQKHlMdSgX6FhO54hd/6
# bAIBZAIBAjATBgNVHSUEDDAKBggrBgEFBQcDAzAOBgNVHQ8BAf8EBAMCB4AwGwYJ
# KwYBBAGCNxUKBA4wDDAKBggrBgEFBQcDAzAdBgNVHQ4EFgQUmJLGUy5fQe1norjU
# Uhte4XQQlmMwHwYDVR0jBBgwFoAUePM9xJ62D9jeEieQW1+shn4FrEgwgdEGA1Ud
# HwSByTCBxjCBw6CBwKCBvYaBumxkYXA6Ly8vQ049YWQtRENDQTAxLUNBLENOPURD
# Q0EwMSxDTj1DRFAsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049U2Vydmlj
# ZXMsQ049Q29uZmlndXJhdGlvbixEQz1hZCxEQz1kb25tb3JnYW4sREM9bmV0P2Nl
# cnRpZmljYXRlUmV2b2NhdGlvbkxpc3Q/YmFzZT9vYmplY3RDbGFzcz1jUkxEaXN0
# cmlidXRpb25Qb2ludDCBxgYIKwYBBQUHAQEEgbkwgbYwgbMGCCsGAQUFBzAChoGm
# bGRhcDovLy9DTj1hZC1EQ0NBMDEtQ0EsQ049QUlBLENOPVB1YmxpYyUyMEtleSUy
# MFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9YWQsREM9
# ZG9ubW9yZ2FuLERDPW5ldD9jQUNlcnRpZmljYXRlP2Jhc2U/b2JqZWN0Q2xhc3M9
# Y2VydGlmaWNhdGlvbkF1dGhvcml0eTAzBgNVHREELDAqoCgGCisGAQQBgjcUAgOg
# GgwYZG9ubS5hZG1pbkBkb25tb3JnYW4ubmV0MA0GCSqGSIb3DQEBCwUAA4ICAQCT
# NzVoYb2DdZV+kNriA0M+a3nq/8bRevpmUHIxLHjPFM6TgQAkNM9xjs2P4srGXvq2
# Qa/GgSaj4p9A7CBa9m8lW8QU4Cb0LTpr1miZfwnyEYEZaliAXqVtePjzjBpXZgF2
# S0/DYM6Lj4/VEcAbJu4GmYH+UQFjO5DFbFBRuxiCTEHwGT+j5vA7FzlIyZWjS3vF
# WRSR+JLXpxTwBfOPWLBQ6EpmIHVfau2273n2m7QUAyq6AngOdFyRKm3hBzOQ6pRb
# EJJOkbnpMtFBzGO9vM6ypbnhOzZeKQYX2PNA8F19tUNXA4Y+Asl+hz8jL0sezmvS
# GO2ndRG64msGoW/CdV3f1IYdKOvcszDyWJYxVHnvzeHPmz0BFQqnUirNYvM7Giys
# PZ9y4u3DoV7KBRgSFv5YstGHToqGmFDdYpCwauw97XTrjfSL9VwERIj9VKdEhTpU
# FShXSOHQysOzdg5za37fYVuBJKssUAWlkSxDGVW+f/vtYafHHGQMd526orjhS8b6
# Aig8qFhNXK537ZSuBJhLOVun+futRDoXLYGD6AiucazGTOu7qPsK545GqyfOWVoO
# coq9GwZE6fH6sTz6KMat2i64ilIBhyj4yVEH3aj60cNAYj+Z2UJWf3d506Xt9era
# +zILaNILE7b8C9hxAwKTz9Pnz2xUBPDCHnBVgMHmXDGCBmMwggZfAgEBMHIwWzET
# MBEGCgmSJomT8ixkARkWA25ldDEZMBcGCgmSJomT8ixkARkWCWRvbm1vcmdhbjES
# MBAGCgmSJomT8ixkARkWAmFkMRUwEwYDVQQDEwxhZC1EQ0NBMDEtQ0ECE2oAAAAS
# NRfwJB0sp1MAAAAAABIwCQYFKw4DAhoFAKB4MBgGCisGAQQBgjcCAQwxCjAIoAKA
# AKECgAAwGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEO
# MAwGCisGAQQBgjcCARUwIwYJKoZIhvcNAQkEMRYEFBYvn+nDhr35dX8PYCR2N9zh
# /bsBMA0GCSqGSIb3DQEBAQUABIICAGMTNkLFU+XUu1OYR+potSAcZaUUuVQJPa10
# n7jtboxvaq8Xddn1r9/eBXp9Ybap6vYpx0zTOIzY/ZK3m6t0YuFn2zlCAvQxl480
# r9FjQig5DQ63h74gB1yMa2PNI3gpg8xLCP7hZCuXdTIjJ5AvytueLt5XxPWgWuFO
# 3N6V5QPoqrYTlfgzDsMHnS04d+WeI5pvJXYyy9jEJeQV06t/StzXD8i+cgUzt2Pm
# dBjSJVf5FgVxKvOm69pAh6T9w74yY3r0RotIKtD4HPC7Ss3znODdRy4qk+YQ3C2A
# eMwIQhWlm6hHrEuVuLegeK+2V926Mcg2sNOX8dMa92dGjRFjh+954fWCJzFZPO96
# te1Hx4rxrqSpgIjxab49ImPe7J4fiox9xGHD/c+CSut6PcDOZWGshH9VM8Oxpkzx
# 2yLkVn6Fy7rQYun/mTMgSnLqCS3xA2nJN2Ixd7wCgryIs10DdGi+MRhA9CdNWckW
# dkwkRJ85jUYs6oUhZjxM5NBwH2Gb73ML4dVyfU2sPTi3L71wI54L3sAEreeqLYb7
# BjHy6RYYaWY3MTCBOLOPs72yMS2IlIOYeIBg63CddoaZ5K9/rzQPhNpMZ560gDOb
# 7E7mlfk2hroZJsg+TZX3ifEBCe7vVzhp3m02/c9Hj6qDremUKW4pt8l+6x/aFfq0
# IyCjIbmWoYIDTDCCA0gGCSqGSIb3DQEJBjGCAzkwggM1AgEBMIGSMH0xCzAJBgNV
# BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1Nh
# bGZvcmQxGDAWBgNVBAoTD1NlY3RpZ28gTGltaXRlZDElMCMGA1UEAxMcU2VjdGln
# byBSU0EgVGltZSBTdGFtcGluZyBDQQIRAIx3oACP9NGwxj2fOkiDjWswDQYJYIZI
# AWUDBAICBQCgeTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJ
# BTEPFw0yMjAzMjAxODIzMTRaMD8GCSqGSIb3DQEJBDEyBDDpF5d1qBlMaXWHLPL0
# yh0puEAe4fRwTZ1xqu2TGxen9GOVy649hf5rprhFKW15uO4wDQYJKoZIhvcNAQEB
# BQAEggIAUa07ypXgvJ6wc7RM9NOjlNeUvknf2lJ2cCs8sPUmXtXBQO8Q4DUVWu1l
# X7gNGlZcQozwtiop/CqTufDUM/5PY/qM9qBWcIKqwdkrt4lHqv2PKHmP6gUHnP8v
# Ekm0Ho87Tqa4oqgHrZGyzx6bu+tzAhNHHVBmFuSlLlABFTVhQzTNc5TQTM2FGVCm
# kOx1ZnCS+xJYWFPA1Anqz1fx2/tCiyaDkbuMigdSoAK49GSSYQ7miN0i8SO9/mLN
# YJ3Fb9sgXJL7ydnEOyP9jv9dlWGwX2I6wRtjrJwbcR4NT1EXBQxy1iHocvoCglQy
# TrSVVmp5chGPGNV2Yzh74FXKlWQ3tIzGaF4UEOec+AxLJcEdmeAJ/DTRVs3m0cHE
# x/XB2kvX9mNe8OcFgmzGRFnQuHhNJzQ13ENG8demNgAARVqwFiCkmeOgQ2m///ho
# 22udsXhTjdW8aVJYleCzFf6qpFresHkWbjaKHHzzGnZOnXjH8C65qIPTM6AYrbEV
# uQg1qXpkOt4eGmBlW/+nWcLz91QNUcNVbtLxkE5QBIz+rrFO4VaIVMhZgcbevyWs
# Z0G4aAF8B1ebkFBocWNHXkF31IPn04nxaVAjOBWYaF+ybmLXWi4/iAlK/SufFj3K
# eGoY2mKbmjQyh6FPXaHcj5vcP6wJMLqy4a5AbDp+QwaxHgy/jYw=
# SIG # End signature block
