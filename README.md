# Scripts

## reset-gpu
The GPU in my Surface Book 3 sometimes does not properly 'wake' out of a low performance state. Disabling it in device manager and re-enabling it usually alleviates this issue.
Since I'm lazy, I wrote a script that utilizes PowerShell to do it for me.

### Usage
Run the .bat file as administrator and your gpu should be reset in a second.

I have made a shortcut to the .bat file, made sure that shortcut runs the .bat as administrator and added `cmd /c "path/to/reset-gpu.bat"` in the target of the shortcut in order for Windows to allow me to pin it my start menu for ultimate quick access.

## Jellyfin Hardware accelleration script
I run Jellyfin in a FreeBSD jail. As this is not officially supported, it is a little wonky sometimes. There is a [port](https://www.freshports.org/multimedia/jellyfin/) available for it and I found a trick to use VAAPI on Intel cpu's through [Thefrank's guide on Github](https://github.com/Thefrank/jellyfin-server-freebsd/blob/main/Installation_TrueNAS_GUI.md#hardware-encoding-intel).
Since Jellyfin does not support using a custom ffmpeg path anymore, I symlink the `lffmpeg` file to `ffmpeg`. This might not survive updates to `ffmpeg`, so I created a script to quickly fix it back up again.

### fix_jellyfin_freebsd_hwaccell.force.sh
This version of the script does the following:
* Remove currently existing `/usr/local/bin/lffmpeg`
* Remove currently existing `/usr/local/bin/original_ffmpeg`
* Force reinstall `ffmpeg`, to make sure we have the latest original files
* Create `/usr/local/bin/lffmpeg`
* Rename `/usr/local/bin/ffmpeg` to `/usr/local/bin/original_ffmpeg`
* Symlink `/usr/local/bin/lffmpeg` to `/usr/local/bin/ffmpeg`

### Usage
* Download the script
* Navigate to the folder
* `chmod +x fix_jellyfin_freebsd_hwaccell.force.sh`
* `./fix_jellyfin_freebsd_hwaccell.force.sh`
* Rejoice!

### NOTE
There's also a more careful version of this script available in this repo, known as `fix_jellyfin_freebsd_hwaccell.sh`. This version will not remove any files or force reinstall libraries, but rather expect the files it creates to not be there.
I moved to the `force` version, as I was simply getting lazy

This version of the script will tell you when it runs into issues and stop execution.
