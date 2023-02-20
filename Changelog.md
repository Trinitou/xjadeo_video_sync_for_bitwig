# Changes in 0.2

## Added

- new project-specific timing settings [#2]
  - *Offset (h)*, *Offset (min)*, *Offset (s)* for video time offset
  - *Loop* check box for looped video playback
- new controller script setting
    - *Time display* allows to activate a *Timecode* or *Frame number* text overlay on top of the video
- link to the [github releases page](https://github.com/Trinitou/xjadeo_video_sync_for_bitwig/releases) in the help doc

# Changes in 0.1.1

## Added

- this changelog
- LICENSE is now included into release zip automatically.

## Changed

- consistently call it 'XJadeo' instead of 'xjadeo' or 'xJadeo'

# Changes in 0.1

## Added

### Initial Bitwig Studio controller script
  - vendor: XJadeo
  - name: XJadeo Video Sync
  - connects to an XJadeo instance opened in OSC remote control mode on port `12345`.
  - Studio I/O panel settings
    - An absolute video file path and frame rate can be defined per project which then will be played back by XJadeo.
    - *Flush!* button: (re-)send all settings to an open XJadeo window
  - Controller script preferences
    - *(?)* button opens the help HTML
    - *Keep on top* checkbox: makes the XJadeo window stay on top of all other windows
    - *Flush!* button: (re-)send all settings to an open XJadeo window
