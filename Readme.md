# Video playback for Bitwig Studio using XJadeo.

A lightweight solution for video playback with [Bitwig Studio](https://www.bitwig.com/de/overview/) using [XJadeo](https://xjadeo.sourceforge.net). A video file can be added per Bitwig project which then will be played back in sync with Bitwig's transport. Also the video will be saved and opened together with the project automatically.

The implementation makes use of XJadeo's OSC remote control capabilities which are documented [here](https://xjadeo.sourceforge.net/osc.html).

## Installation

1. Put the .js into the Bitwig controller script folder
2. Add the controller script in Bitwig Studio
    - via *Dashboard -> 'Settings' -> 'Controllers' -> '+ Add Controller'*
    - select hardware vendor: 'XJadeo'
    - select product: 'XJadeo Video Sync'
    - click *'Add'*
3. Click the "?" icon and follow the setup instructions in the help HTML

## Build

Nothing to build for the controller script, but the help documentation HTML is generated from the [help.md](./doc/help.md) using the [generate_HTML.ps1](./doc/generate_HTML.ps1) script which requires Powershell 7 to work.

## Contribution

Please feel free to create a pull request if you want to add or change something! Also have a look into open issues if you want so.
