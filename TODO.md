# TODO

- uBlock Origin config - <https://github.com/gorhill/uBlock/wiki/Deploying-uBlock-Origin:-configuration>
- REW
  - http://www.roomeqwizard.com/
  - https://sourceforge.net/projects/equalizerapo/
  - https://realtraps.com/art_microphones.htm

## Notes

### VSCode `settings.json`

Allow changes by VSCode to be reflected back into `{{ .chezmoi.sourceDir }}` via symlinks.

- [Handle configuration files that are externally modified and also in different locations on difference machines #1312](https://github.com/twpayne/chezmoi/discussions/1312)

### Firefox via `policies.json`

Refreshed every `chezmoi apply`.

- Docs: <https://mozilla.github.io/policy-templates/>
- Schema: <https://github.com/mozilla/policy-templates/blob/master/linux/policies.json>
- Use addon `guid` inside `policies.json` for the JSON key. Example: <https://addons.mozilla.org/api/v5/addons/addon/temporary-containers/>

## Review

- https://github.com/twpayne/dotfiles
- https://github.com/Nitestack/dotfiles
- https://github.com/agarun/dotfiles
- https://github.com/MikeMcQuaid/dotfiles/blob/main/Brewfile
- https://github.com/drmohundro/dotfiles
- https://github.com/ctdio/dotfiles/