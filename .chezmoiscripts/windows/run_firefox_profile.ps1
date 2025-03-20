# @sse darwin / linux: .chezmoiscripts/run_firefox_profile.sh.tmpl
New-Item -ItemType Directory -Force -Path "C:\Program Files\Mozilla Firefox\distribution\"
Copy-Item ".config\firefox\policies.json" -Destination "C:\Program Files\Mozilla Firefox\distribution\"
