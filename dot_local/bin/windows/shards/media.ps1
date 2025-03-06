Write-Host "win11-shard: media"

winget install --exact --id VideoLAN.VLC
# mpv is missing in winget but in chocolately (see unigetui and ..\chocolately.ubundle)
# https://mpv.io/installation/
