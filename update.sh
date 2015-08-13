LINUX_BUILD=2
MAC_BUILD=2
WINDOWS_BUILD=8
VERSION='0.12.0'
MINOR='44'
GPG='986FF288'

# rm dash-*

# wget https://dashpay.atlassian.net/builds/artifact/DASHW-REL/JOB1/build-$WINDOWS_BUILD/gitian-win-dash-dist/dash-$VERSION-win32.zip -O dash-$VERSION.$MINOR-win32.zip
# wget https://dashpay.atlassian.net/builds/artifact/DASHW-REL/JOB1/build-$WINDOWS_BUILD/gitian-win-dash-dist/dash-$VERSION-win64.zip -O dash-$VERSION.$MINOR-win64.zip
# wget https://dashpay.atlassian.net/builds/artifact/DASHW-REL/JOB1/build-$WINDOWS_BUILD/-gitian-win-dash-installer/dash-0.12.0-win32-setup.exe  -O dash-$VERSION.$MINOR-win32-setup.exe
# wget https://dashpay.atlassian.net/builds/artifact/DASHW-REL/JOB1/build-$WINDOWS_BUILD/-gitian-win-dash-installer/dash-0.12.0-win64-setup.exe  -O dash-$VERSION.$MINOR-win64-setup.exe

# wget https://dashpay.atlassian.net/builds/artifact/DASHL-GITIAN/JOB1/build-$LINUX_BUILD/gitian-linux-dash-dist/dash-$VERSION-linux32.tar.gz -O dash-$VERSION.$MINOR-linux32.tar.gz
# wget https://dashpay.atlassian.net/builds/artifact/DASHL-GITIAN/JOB1/build-$LINUX_BUILD/gitian-linux-dash-dist/dash-$VERSION-linux64.tar.gz -O dash-$VERSION.$MINOR-linux64.tar.gz

# wget https://dashpay.atlassian.net/builds/browse/DASHM-REL-$MAC_BUILD/artifact/JOB1/gitian-osx-dash-dist/dash-$VERSION-osx-unsigned.dmg  -O dash-$VERSION.$MINOR-osx.dmg


gpg -b --armor -u $GPG --no-emit-version dash-$VERSION.$MINOR-linux32.tar.gz
gpg -b --armor -u $GPG --no-emit-version dash-$VERSION.$MINOR-linux64.tar.gz
gpg -b --armor -u $GPG --no-emit-version dash-$VERSION.$MINOR-win32-setup.exe
gpg -b --armor -u $GPG --no-emit-version dash-$VERSION.$MINOR-win64-setup.exe
gpg -b --armor -u $GPG --no-emit-version dash-$VERSION.$MINOR-win32.zip
gpg -b --armor -u $GPG --no-emit-version dash-$VERSION.$MINOR-win64.zip
gpg -b --armor -u $GPG --no-emit-version dash-$VERSION.$MINOR-osx.dmg

git add *
git commit -am "$VERSION.$MINOR"

