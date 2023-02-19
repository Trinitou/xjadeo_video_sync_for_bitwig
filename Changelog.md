# Changes in 0.1.1

## Added

- this changelog
- LICENSE is now included into release zip automatically.

## Changed

- consistently call it 'XJadeo' instead of 'xjadeo' or 'xJadeo'

# Changes in 0.1.0

## Added

### Initial Bitwig Studio controller script
  - vendor: XJadeo
  - name: XJadeo Video Sync
  - connects to an XJadeo instance opened in OSC remote control mode on port `12345`.
  - Studio I/O panel settings
    - An absolute video file path and frame rate can be defined per project which then will be played back by XJadeo.
    - 'Flush!' button: (re-)send all settings to an open XJadeo window
  - Controller script preferences
    - '?' button opens the help HTML
    - 'Keep on top' checkbox: makes the XJadeo window stay on top of all other windows
    - 'Flush!' button: (re-)send all settings to an open XJadeo window
