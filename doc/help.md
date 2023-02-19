# XJadeo Video Synchronization

## Setup

- **Download and install XJadeo**, e.g. from [here](https://xjadeo.sourceforge.net/download.html)
- **Launch the *'launch XJadeo.bat'* script**. This opens the XJadeo window.
- In Bitwig Studio, connect the video file for playback like this:
  - Open a project.
  - In the *Studio I/O panel*, unfold the *XJadeo Video Sync* settings.
    - Enter the absolute video file path under *Path*.
    - Enter the original frame rate of the video under *Frame rate*.
    - For looped video playback, activate the *Loop* checkbox

## Features
- If you save the project and open it later, the video will be opened again together with the project.
- You can easily switch Bitwig project tabs with different videos and the XJadeo window will be udpated on the fly!
- There is a *Keep on top* checkbox which will ensure that the video window stays in front of Bitwig Studio. (default: on)
- The *Flush!* button in the settings will (re-)send all data to the XJadeo window. This is helpful if XJadeo was opened after Bitwig Studio.

## Tipps & tricks

- 'Where to quickly find original video frame?'
  - When using the *'launch XJadeo.bat'* script, a console window will open as well. Look into the log text!
- How to hear the original sound of the video file in sync with the video?
  - If Bitwig supports the file format, you can drag it into the project so that.
    - Place it into the Arranger at position 1.1.1.00
    - Make sure that time-stretching is off for that audio clip (*Mode* set to *Raw*)

## What's new?

If you want to see the recent feature additions and changes, please have a look into the [changelog](./doc/changelog.html).
