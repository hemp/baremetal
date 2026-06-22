#!/bin/bash
#
# SPOTLIGHT CONFIG. macOS 26 (Tahoe / "Super Spotlight"). Snapshot 2026-06-17.
#
# Legacy `com.apple.Spotlight orderedItems` enum gone. Config now 3 stores, 2 domains:
#
#   1. com.apple.Spotlight EnabledPreferenceRules
#        "Results from System" sources. Name misleading: PRESENT = source OFF
#        (uniform hide-list). Verified by controlled single-toggle UI diffs --
#        Apps, Files, Stocks, Music all flip via presence here.
#        IDs = app bundle ids / System.* / Custom.* / Domain.*.
#
#   2. com.apple.Spotlight DisabledUTTypes
#        File-type deny-list. UTIs (public.font etc). Suppressed everywhere.
#        A "Domain.*" category can ALSO write here (see Music note below).
#
#   3. com.apple.corespotlightui CSReceiverBundleIdentifierState
#        Per-app content map. Every app = 1 (on). Set 0 = hide app content.
#        Backs long app list in System Settings > Spotlight.
#
# NOTE: store #1 only governs the Spotlight *UI*. The filesystem INDEXER
# (mdutil/mds) runs regardless. To kill file content noise (e.g. VS Code Local
# History) exclude its directory via Search Privacy -- see section 4.
# (.metadata_never_index markers are IGNORED on this macOS -- do not rely on them.)
#
# Run: ~/.local/bin/spotlight.sh
set -euo pipefail

# --- 1. Content sources. com.apple.Spotlight EnabledPreferenceRules ---
# HIDE-LIST. PRESENT here = that source's results are OFF.
#   uncomment a line  -> source HIDDEN (off)
#   comment a line out -> source SHOWN (on, the default)
# Full -array replace, so this block is the complete truth each run.
# (Built as a bash array so lines CAN be commented -- a `#` inside a
#  backslash-continued `defaults ... -array \` command would break it.)
HIDE_SOURCES=(
  # -- meta --
  "Custom.relatedContents"            # Siri / related suggestions
  # -- system categories --
  # "System.applications"             # Apps (launch by name) -- KEEP COMMENTED to allow launching
  "System.files"                      # Files            (off: all file results, incl. VS Code noise)
  "System.documents"                  # Documents
  "System.folders"                    # Folders
  "System.iphoneApps"                 # iPhone Mirroring apps
  "System.menuItems"                  # Menu items / actions
  # -- domains (content-type categories) --
  # To truly hide one, uncomment it here AND its paired UTIs in section 2
  # (the UI does both). All 8 captured from a full "Results from System" sweep.
  # "Domain.SOURCE"                   # Source code   (public.source-code, public.shell-script, public.xml, ...)
  # "Domain.IMAGES"                   # Images        (public.image)
  # "Domain.MOVIES"                   # Movies        (public.movie, public.mpeg*, public.3gpp*)
  # "Domain.MUSIC"                    # Music         (public.audio, public.mpeg-4-audio, com.apple.protected-mpeg-4-audio)
  # "Domain.PDF"                      # PDF           (com.adobe.pdf, com.apple.localized-pdf-bundle)
  # "Domain.PRESENTATIONS"            # Presentations (public.presentation, keynote, .ppt/.pptx)
  # "Domain.SPREADSHEETS"             # Spreadsheets  (public.spreadsheet, numbers, .xls/.xlsx)
  # "Domain.MENU_OTHER"               # "Other"
  # -- apple apps --
  "com.apple.AppStore"                # App Store
  "com.apple.iBooksX"                 # Books
  "com.apple.iCal"                    # Calendar
  "com.apple.clock"                   # Clock
  "com.apple.AddressBook"             # Contacts
  "com.apple.Dictionary"              # Dictionary / definitions
  "com.apple.FaceTime"                # FaceTime
  "com.apple.mail"                    # Mail
  "com.apple.Maps"                    # Maps
  "com.apple.MobileSMS"               # Messages
  "com.apple.news"                    # News
  "com.apple.Notes"                   # Notes
  "com.apple.iWork.Pages"             # Pages
  "com.apple.mobilephone"             # Phone
  "com.apple.Photos"                  # Photos
  "com.apple.podcasts"                # Podcasts
  "com.apple.reminders"               # Reminders
  "com.apple.Safari"                  # Safari (history + bookmarks)
  "com.apple.shortcuts"               # Shortcuts
  "com.apple.stocks"                  # Stocks
  "com.apple.tips"                    # Tips
  "com.apple.VoiceMemos"              # Voice Memos
  # "com.apple.systempreferences"     # System Settings -- ENABLED
  # (no third-party apps here -- they come and go; Section 3's default-hidden
  #  allow-list handles ALL apps, including newly-installed ones.)
)
if ((${#HIDE_SOURCES[@]})); then
  defaults write com.apple.Spotlight EnabledPreferenceRules -array "${HIDE_SOURCES[@]}"
else
  defaults write com.apple.Spotlight EnabledPreferenceRules -array
fi

# --- 2. File-type filter. com.apple.Spotlight DisabledUTTypes ---
# UTI deny-list. Empty = no type filtering.
# DOMAINS FINDING: turning "Music" OFF in the UI does a DUAL write -- it adds
# "Domain.MUSIC" to store #1 AND these audio UTIs here. Listed (commented) so
# they don't have to be guessed; we don't manage domains, so left empty.
# Examples -- uncomment to suppress that type everywhere:
DISABLED_UTTYPES=(
  # --- common standard UTIs ---
  # "public.font"                       # all fonts (.ttf/.otf/...)
  # "public.source-code"                # source files (.c/.py/.swift/...)
  # "public.image"                      # all images
  # "com.adobe.pdf"                     # PDFs
  # --- Music category's UTIs (paired with Domain.MUSIC in section 1) ---
  # "public.audio"                      # audio
  # "public.mpeg-4-audio"               # .m4a
  # "com.apple.protected-mpeg-4-audio"  # protected AAC
)
# Custom file EXTENSION (e.g. ".log"): macOS has no static UTI, so it mints a
# dynamic one. The UI writes a PAIR -- "FileExtension.dyn.<blob>" into section 1
# AND "dyn.<blob>" here. The <blob> is generated (not hand-writable), so add
# such extensions via the Spotlight UI, then capture the pair with:
#   defaults read com.apple.Spotlight DisabledUTTypes
# (Verified: a test extension decoded back via UTType to its exact string.)
if ((${#DISABLED_UTTYPES[@]})); then
  defaults write com.apple.Spotlight DisabledUTTypes -array "${DISABLED_UTTYPES[@]}"
else
  defaults write com.apple.Spotlight DisabledUTTypes -array
fi

# --- 3. Per-app content. com.apple.corespotlightui CSReceiverBundleIdentifierState ---
# DEFAULT-HIDDEN (allow-list) model: macOS registers every new app here as =1
# (shown), so a deny-list can't keep up. Instead we hide EVERY currently-
# registered app EXCEPT an explicit allow-list, and best-effort flip the default
# for future apps to off. Re-run (e.g. on login) to catch newcomers.
#
# Governs app *content* results -- NOT app launching (that's System.applications,
# the "Apps" category in section 1, left ON) and NOT the inline calculator
# (built-in). So list only apps whose indexed CONTENT you want surfaced.
SHOW_APP_CONTENT=(
  "com.apple.systempreferences"       # System Settings
  "com.apple.calculator"              # Calculator
)
# best-effort: make NEW receivers default to OFF (undocumented key; verify on
# next app install -- may or may not be honored).
defaults write com.apple.corespotlightui CSReceiverBundleIdentifierState \
  -dict-add "com.apple.ExtensionsSettings.DefaultExtensionEnablement" -int 0
# hide every currently-registered app unless allow-listed
defaults read com.apple.corespotlightui CSReceiverBundleIdentifierState 2>/dev/null \
  | sed -nE 's/^[[:space:]]*"?([A-Za-z0-9._-]+)"?[[:space:]]*=[[:space:]]*[0-9]+;$/\1/p' \
  | while read -r app; do
      case "$app" in
        com.apple.ExtensionsSettings.DefaultExtensionEnablement|com.apple.fskit.ModuleEnablement) continue ;;
      esac
      keep=0
      for a in "${SHOW_APP_CONTENT[@]}"; do [ "$app" = "$a" ] && keep=1; done
      defaults write com.apple.corespotlightui CSReceiverBundleIdentifierState \
        -dict-add "$app" -int "$keep"
    done

# --- 4. Exclude dirs from the INDEX via Spotlight Search Privacy (VolumeConfiguration.plist) ---
# WHY here, not .metadata_never_index: those markers are BROKEN on this macOS
# (verified -- ignored). Search Privacy is the only reliable exclusion. It IS
# scriptable, but UNSUPPORTED and needs sudo: the plist is root-owned and
# daemon-managed (mds can overwrite), so treat as best-effort and VERIFY after.
#   verify : mdfind -onlyin <dir> -count '*'      (expect 0 after the rebuild below)
#   inspect: sudo mdutil -P /System/Volumes/Data
# Note: user files live on the /System/Volumes/Data store -- that's the volume
# whose VolumeConfiguration.plist we edit and the store we reindex.
EXCLUDE_DIRS=(
  "$HOME/go"                                            # Go workspace
  "$HOME/work"                                          # all work projects / repos
  "$HOME/Library"                                       # app data/caches/containers
                                                        # (also drops Mail + iCloud Drive from search;
                                                        #  for narrower, list Caches/"Application Support"/Containers)
)
VOLCONF="/System/Volumes/Data/.Spotlight-V100/VolumeConfiguration.plist"
PB="/usr/libexec/PlistBuddy"
if ((${#EXCLUDE_DIRS[@]})); then
  read -r -p "Write Spotlight Search Privacy exclusions? (sudo, unsupported) [y/N] " priv
  case "$priv" in
    [yY]*)
      sudo mdutil -i off /System/Volumes/Data >/dev/null || true      # quiesce the indexer first
      sudo "$PB" -c 'Print :Exclusions' "$VOLCONF" >/dev/null 2>&1 \
        || sudo "$PB" -c 'Add :Exclusions array' "$VOLCONF"           # ensure the array exists
      for dir in "${EXCLUDE_DIRS[@]}"; do
        if sudo plutil -p "$VOLCONF" 2>/dev/null | grep -qF "\"$dir\""; then
          echo "  already excluded: $dir"
        else
          sudo "$PB" -c "Add :Exclusions: string $dir" "$VOLCONF" && echo "  excluded: $dir"
        fi
      done
      sudo mdutil -i on /System/Volumes/Data >/dev/null || true       # re-enable (re-reads exclusions)
      echo "  exclusions written -- run the rebuild prompt below to purge existing entries."
      ;;
  esac
fi

# --- Apply ---
killall Spotlight 2>/dev/null || true

# --- Optional: open settings to review ---
read -r -p "Open Spotlight settings to review? [y/N] " ans
case "$ans" in
  [yY]*)
    sleep 3
    open "x-apple.systempreferences:com.apple.Spotlight-Settings.extension"
    ;;
esac

# --- Optional: rebuild Spotlight index (sudo; slow, runs in background) ---
# Needed to PURGE entries already indexed in the dirs excluded above (writing
# the exclusion only stops future indexing). Use -a (ALL stores): user files
# live on the SEPARATE /System/Volumes/Data store, so "mdutil -E /" alone
# rebuilds the wrong store and misses them (verified: left the home index untouched).
read -r -p "Rebuild Spotlight index (all stores)? (sudo, slow) [y/N] " reb
case "$reb" in
  [yY]*) sudo mdutil -a -E ;;   # nuclear fallback if needed: sudo mdutil -a -i off && sudo mdutil -a -i on
esac
