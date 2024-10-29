#!/bin/sh

if [ ! -e /usr/local/bin/ffmpeg ]
then
  echo "'/usr/local/bin/ffmpeg' does not exist!"
  echo "Exiting"
  return
fi

if [ -e /usr/local/bin/original_ffmpeg ]
then
  echo "'/usr/local/bin/original_ffmpeg' already exists!"
  echo "Exiting"
  return
fi

echo "This script will create /usr/local/bin/lffmpeg with the following contents:"
echo ""
echo "  #!/bin/sh"
echo "  original_ffmpeg -hwaccel vaapi "$@""
echo ""
echo "And then rename /usr/local/bin/ffmpeg to original_ffmpeg and symlink lffmpeg to ffmpeg"
echo ""
echo ""

if [ ! -e /usr/local/bin/lffmpeg ]
then
  echo "/usr/local/bin/lffmpeg does not exist!"
  echo "Creating..."
  printf '#\!/bin/sh\noriginal_ffmpeg -hwaccel vaapi "$@"\n' > /usr/local/bin/lffmpeg
  chmod +x /usr/local/bin/lffmpeg
fi

if [ -e /usr/local/bin/lffmpeg ]
then
  echo "Renaming ffmpeg to original_ffmpeg..."
  mv /usr/local/bin/ffmpeg /usr/local/bin/original_ffmpeg
  echo "Symlinking lffmpeg to ffmpeg..."
  ln -s /usr/local/bin/lffmpeg /usr/local/bin/ffmpeg
  echo "Done!"
fi
