
LINUX_BUILD=169
MAC_BUILD=135
WINDOWS_BUILD=159
VERSION='0.11.1.26'
GPG='986FF288'

rm dash-*

wget http://bamboo.darkcoin.qa/browse/DRKL-DEV-$LINUX_BUILD/artifact/JOB1/gitian-linux-dash-dist/dash-$VERSION-linux.tar.gz -O dash-$VERSION-linux.tar.gz
wget http://bamboo.darkcoin.qa/browse/DRKL-DEV-$LINUX_BUILD/artifact/JOB1/gitian-linux-dash-DIGESTS/dash-$VERSION-linux.tar.gz.DIGESTS.txt -O dash-$VERSION-linux.tar.gz.DIGESTS.txt

#---

wget http://bamboo.darkcoin.qa/browse/DRKM-DEV-$MAC_BUILD/artifact/JOB1/gitian-osx-dash-dist/dash-$VERSION-osx.dmg -O dash-$VERSION-osx.dmg
wget http://bamboo.darkcoin.qa/browse/DRKM-DEV-$MAC_BUILD/artifact/JOB1/gitian-osx-dash-DIGESTS/dash-$VERSION-osx.dmg.DIGESTS.txt -O dash-$VERSION-osx.dmg.DIGESTS.txt

#---

wget http://bamboo.darkcoin.qa/browse/DRKW-DEV-$WINDOWS_BUILD/artifact/JOB1/gitian-win-dash-dist/dash-$VERSION-win.zip -O dash-$VERSION-win.zip
wget http://bamboo.darkcoin.qa/artifact/DRKW-DEV/JOB1/build-$WINDOWS_BUILD/gitian-win-dash-bin/64/dash-0.11.0-win64-setup.exe -O dash-$VERSION-win32-setup.exe
wget http://bamboo.darkcoin.qa/artifact/DRKW-DEV/JOB1/build-$WINDOWS_BUILD/gitian-win-dash-DIGESTS/dash-$VERSION-win.zip.DIGESTS.txt -O dash-$VERSION-win.zip.DIGESTS.txt
wget http://bamboo.darkcoin.qa/artifact/DRKW-DEV/JOB1/build-$WINDOWS_BUILD/gitian-win-dash-DIGESTS/dash-$VERSION-win32-setup.exe.DIGESTS.txt -O dash-$VERSION-win32-setup.exe.DIGESTS.txt

#---

gpg -b --armor -u $GPG --no-emit-version dash-$VERSION-linux.tar.gz
gpg -b --armor -u $GPG --no-emit-version dash-$VERSION-win32-setup.exe
gpg -b --armor -u $GPG --no-emit-version dash-$VERSION-win.zip
gpg -b --armor -u $GPG --no-emit-version dash-$VERSION-osx.dmg

git add *
git commit -am "$VERSION"
