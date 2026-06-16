# @see darwin / linux: .chezmoiscripts/run_thunderbird_profile.sh.tmpl
New-Item -ItemType Directory -Force -Path "C:\Program Files\Mozilla Thunderbird\distribution\"
Copy-Item ".config\thunderbird\policies.json" -Destination "C:\Program Files\Mozilla Thunderbird\distribution\"
