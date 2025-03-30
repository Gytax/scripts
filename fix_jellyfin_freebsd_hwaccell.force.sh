#!/bin/sh

echo "This script will force reinstall ffmpeg, then create /usr/local/bin/lffmpeg with the following contents:"
echo ""
echo "  #!/bin/sh"
echo "  original_ffmpeg -hwaccel vaapi "$@""
echo ""
echo "And then rename /usr/local/bin/ffmpeg to original_ffmpeg and symlink lffmpeg to ffmpeg"
echo ""
echo ""

if [ -e /usr/local/bin/lffmpeg ]
then
  echo "/usr/local/bin/lffmpeg exists! Removing..."
  rm /usr/local/bin/lffmpeg
fi

if [ -e /usr/local/bin/original_ffmpeg ]
then
  echo "/usr/local/bin/original_ffmpeg exists! Removing..."
  rm /usr/local/bin/original_ffmpeg
fi

echo "Force installing ffmpeg"
pkg install -f -y ffmpeg

echo "Creating /usr/local/bin/lffmpeg..."
printf '#\!/bin/sh\noriginal_ffmpeg -hwaccel vaapi "$@"\n' > /usr/local/bin/lffmpeg
chmod +x /usr/local/bin/lffmpeg

echo "Renaming ffmpeg to original_ffmpeg..."
mv /usr/local/bin/ffmpeg /usr/local/bin/original_ffmpeg
echo "Symlinking lffmpeg to ffmpeg..."
ln -s /usr/local/bin/lffmpeg /usr/local/bin/ffmpeg

echo "Done!"
