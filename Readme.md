# Video playback for Bitwig Studio using XJadeo.

A lightweight solution for video playback with [Bitwig Studio](https://www.bitwig.com/de/overview/) using [XJadeo](https://xjadeo.sourceforge.net). A video file can be added per Bitwig project which then will be played back in sync with Bitwig's transport. Also the video will be saved and opened together with the project automatically.

The implementation makes use of XJadeo's OSC remote control capabilities which are documented [here](https://xjadeo.sourceforge.net/osc.html).

## Installation

1. Download the release ZIP from [here](https://github.com/Trinitou/xjadeo_video_sync_for_bitwig/releases/latest) and extract it into the Bitwig controller script folder
3. Add the controller script in Bitwig Studio
    - via the Dashboard -> *Settings* -> *Controllers* -> *+ Add Controller*
    - select hardware vendor: *XJadeo*
    - select product: *XJadeo Video Sync*
    - click *Add*
4. Click the *(?)* button and follow the setup instructions in the help HTML

## Contribution

Please feel free to create a pull request if you want to add or change something! Also have a look into open issues if you want so.
