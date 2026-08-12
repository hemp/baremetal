# Notes

## Breadcrumbs

### VSCode `settings.json`

Allow changes by VSCode to be reflected back into `{{ .chezmoi.sourceDir }}` via symlinks.

- [Handle configuration files that are externally modified and also in different locations on difference machines #1312](https://github.com/twpayne/chezmoi/discussions/1312)

### Firefox via `policies.json`

Refreshed every `chezmoi apply`.

- Docs: <https://mozilla.github.io/policy-templates/>
- Schema: <https://github.com/mozilla/policy-templates/blob/master/linux/policies.json>
- User prefs: <https://github.com/mozilla-firefox/firefox/blob/main/browser/app/profile/firefox.js>
- Use addon `guid` inside `policies.json` for the JSON key. Example: <https://addons.mozilla.org/api/v5/addons/addon/temporary-containers/>
- uBlock Origin filter-list tokens + defaults (entries with no `off`/`lang` are on by default): <https://github.com/gorhill/uBlock/blob/master/assets/assets.json>

### Thunderbird via `policies.json`

Refreshed every `chezmoi apply`. Same Mozilla policy engine as Firefox; only Thunderbird-supported policies apply.

- Docs: <https://thunderbird.github.io/policy-templates/>
- Template (ESR 140): <https://thunderbird.github.io/policy-templates/templates/esr140/>
- Addons come from `addons.thunderbird.net` (not `addons.mozilla.org`).
- Install paths: macOS `Thunderbird.app/Contents/Resources/distribution/`, Linux `/etc/thunderbird/policies/`, Windows `distribution/` next to `thunderbird.exe`.

## Review

### dotfiles

- <https://mise.jdx.dev/bootstrap.html>

- <https://github.com/twpayne/dotfiles>
- <https://github.com/Nitestack/dotfiles>
- <https://github.com/agarun/dotfiles>
- <https://github.com/MikeMcQuaid/dotfiles/blob/main/Brewfile>
- <https://github.com/drmohundro/dotfiles>

### Wallpapers

- <https://github.com/makccr/wallpapers>
- <https://github.com/harilvfs/wallpapers>

## TODO

- REW
  - <http://www.roomeqwizard.com/>
  - <https://sourceforge.net/projects/equalizerapo/>
  - <https://realtraps.com/art_microphones.htm>
- Launchers
  - <https://macos-defaults.com/>
  - <https://ueli.app/>
  - <https://github.com/anyrun-org/anyrun>
  - <https://github.com/unsecretised/rustcast>
