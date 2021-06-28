# Scripts

## reset-gpu
The GPU in my Surface Book 3 sometimes does not properly 'wake' out of a low performance state. Disabling it in device manager and re-enabling it usually alleviates this issue.
Since I'm lazy, I wrote a script that utilizes PowerShell to do it for me.

### Usage
Run the .bat file as administrator and your gpu should be reset in a second.

I have made a shortcut to the .bat file, made sure that shortcut runs the .bat as administrator and added `cmd /c "path/to/reset-gpu.bat"` in the target of the shortcut in order for Windows to allow me to pin it my start menu for ultimate quick access.