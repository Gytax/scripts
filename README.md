# Scripts

## reset-gpu
The GPU in my Surface Book 3 sometimes does not properly 'wake' out of a low performance state. Disabling it in device manager and re-enabling it usually alleviates this issue.
Since I'm lazy, I wrote a script that utilizes PowerShell to do it for me.

### Usage
Run the .bat file as administrator and your gpu should be reset in a second.

I have made a shortcut to the .bat file, made sure that shortcut runs the .bat as administrator and added `cmd /c "path/to/reset-gpu.bat"` in the target of the shortcut in order for Windows to allow me to pin it my start menu for ultimate quick access.

## fix_jellyfin_freebsd_hwaccell.sh
I run Jellyfin in a FreeBSD jail. As this is not officially supported, it is a little wonky sometimes. There is a [port](https://www.freshports.org/multimedia/jellyfin/) available for it and I found a trick to use VAAPI on Intel cpu's through [Thefrank's guide on Github](https://github.com/Thefrank/jellyfin-server-freebsd/blob/main/Installation_TrueNAS_GUI.md#hardware-encoding-intel).

Since Jellyfin does not support using a custom ffmpeg path anymore, I symlink the `lffmpeg` file to `ffmpeg`. This might not survive updates to `ffmpeg`, so I created a script to quickly fix it back up again by:
* Creating `/usr/local/bin/lffmpeg` if it doesn't exist
* Rename `/usr/local/bin/ffmpeg` to `/usr/local/bin/original_ffmpeg`
* symlink `/usr/local/bin/lffmpeg` to `/usr/local/bin/ffmpeg`

### Usage
* Download the script
* Navigate to the folder
* `chmod +x fix_jellyfin_freebsd_hwaccell`
* `./fix_jellyfin_freebsd_hwaccell.sh`
* Rejoice!

The script will tell you when it runs into issues and stop execution.
It currently stops when `/usr/local/bin/ffmpeg` does not exist or when `/usr/local/bin/original_ffmpeg` already exists.
