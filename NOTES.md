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

### Chrome via `policies.json`

Refreshed every `chezmoi apply` for Google Chrome, Google Chrome Canary, and Chromium. Verify applied policies at `chrome://policy`.

- Chrome Browser Enterprise resources and policy examples: <https://github.com/google/ChromeBrowserEnterprise>
- Policy reference: <https://chromeenterprise.google/policies/>
- Canonical source: `dot_config/chrome/policies.json`
- macOS: Generates `~/.config/chrome/policies.mobileconfig`. Apple requires interactive installation or replacement:
  1. `open ~/.config/chrome/policies.mobileconfig`
  2. `open "x-apple.systempreferences:com.apple.Profiles-Settings.extension"`
  3. Select the **Dotfiles: Chrome, Chrome Canary, and Chromium policies** profile and approve **Install** or **Replace**.
- Linux: Installs `policies.json` under `/etc/opt/chrome/policies/managed/` and `/etc/chromium/policies/managed/`.
- Windows: Writes policies under `HKLM\Software\Policies\Google\Chrome` and `HKLM\Software\Policies\Chromium`.

### Thunderbird via `policies.json`

Refreshed every `chezmoi apply`. Same Mozilla policy engine as Firefox; only Thunderbird-supported policies apply.

- Docs: <https://thunderbird.github.io/policy-templates/>
- Template (ESR 140): <https://thunderbird.github.io/policy-templates/templates/esr140/>
- Addons come from `addons.thunderbird.net` (not `addons.mozilla.org`).
- Install paths: macOS `Thunderbird.app/Contents/Resources/distribution/`, Linux `/etc/thunderbird/policies/`, Windows `distribution/` next to `thunderbird.exe`.

## Lint

Render chezmoi shell templates for macOS and Linux, then run ShellCheck in a pinned Docker environment:

```sh
docker build -f lint.Dockerfile -t dotfiles-lint .
docker run --rm dotfiles-lint
```

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
