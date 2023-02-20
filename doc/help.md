# XJadeo Video Synchronization

## Setup

1. **Download and install XJadeo**, e.g. from [here](https://xjadeo.sourceforge.net/download.html)
1. **Launch the *'launch XJadeo.bat'* script**. This opens the XJadeo window.
1. In Bitwig Studio, connect the video file for playback like this:

    1. Open a project.
    1. In the *Studio I/O panel*, unfold the *XJadeo Video Sync* settings.
    1. Enter the absolute video file path under *Path*.
    1. Enter the original frame rate of the video under *Frame rate*.

## Features & Settings
- If you save the project and open it later, the video will be opened again together with the project.
- You can easily switch Bitwig project tabs with different videos and the XJadeo window will be udpated on the fly!
- The *Flush!* buttons in the preferences and project-specific settings will (re-)send all data to the XJadeo window. This is helpful if XJadeo was opened after Bitwig Studio.

### Project-specific settings
  - Set a timing offset using the *Offset (h/min/s)* settings, if so desired
  - For looped video playback, activate the *Loop* checkbox

### Preferences
  - The *Keep on top* checkbox which will ensure that the video window stays in front of Bitwig Studio. (default: on)
  - The *Time display* setting allows you to activate a *Timecode* or *Frame number* text overlay on top of the video.

## Tipps & tricks

- 'Where to quickly find original video frame?'
  - When using the *'launch XJadeo.bat'* script, a console window will open as well. Look into the log text!
- How to hear the original sound of the video file in sync with the video?
  - If Bitwig supports the file format, you can drag it into the project so that.
    - Place it into the Arranger at position 1.1.1.00
    - Make sure that time-stretching is off for that audio clip (*Mode* set to *Raw*)

## What's new?

If you want to see the recent feature additions and changes, please have a look into the [changelog](./doc/changelog.html).

For newer versions of this script, please look for updates at the [github repository](https://github.com/Trinitou/xjadeo_video_sync_for_bitwig/releases).
