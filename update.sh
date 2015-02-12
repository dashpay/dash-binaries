LINUX_BUILD=72
MAC_BUILD=70
WINDOWS_BUILD=74
VERSION='0.11.1'
MINOR='23'
GPG='986FF288'

rm darkcoin-*

wget http://bamboo.darkcoin.qa/browse/DRKL-GITIAN-$LINUX_BUILD/artifact/JOB1/gitian-linux-darkcoin-dist/darkcoin-$VERSION.$MINOR-linux.tar.gz -O darkcoin-$VERSION.$MINOR-linux.tar.gz
wget http://bamboo.darkcoin.qa/browse/DRKL-GITIAN-$LINUX_BUILD/artifact/JOB1/gitian-linux-darkcoin-DIGESTS/darkcoin-$VERSION.$MINOR-linux.tar.gz.DIGESTS.txt -O darkcoin-$VERSION.$MINOR-linux.tar.gz.DIGESTS.txt

#---

wget http://bamboo.darkcoin.qa/browse/DRKM-GITIAN-$MAC_BUILD/artifact/JOB1/gitian-osx-darkcoin-dist/darkcoin-$VERSION.$MINOR-osx.dmg -O darkcoin-$VERSION.$MINOR-osx.dmg
wget http://bamboo.darkcoin.qa/browse/DRKM-GITIAN-$MAC_BUILD/artifact/JOB1/gitian-osx-darkcoin-DIGESTS/darkcoin-$VERSION.$MINOR-osx.dmg.DIGESTS.txt -O darkcoin-$VERSION.$MINOR-osx.dmg.DIGESTS.txt

#---

wget http://bamboo.darkcoin.qa/browse/DRKW-GITIAN-$WINDOWS_BUILD/artifact/JOB1/gitian-win-darkcoin-dist/darkcoin-$VERSION.$MINOR-win.zip -O darkcoin-$VERSION.$MINOR-win.zip
wget http://bamboo.darkcoin.qa/artifact/DRKW-GITIAN/JOB1/build-$WINDOWS_BUILD/gitian-win-darkcoin-bin/32/darkcoin-$VERSION-win32-setup.exe -O darkcoin-$VERSION.$MINOR-win32-setup.exe
wget http://bamboo.darkcoin.qa/artifact/DRKW-GITIAN/JOB1/build-$WINDOWS_BUILD/gitian-win-darkcoin-DIGESTS/darkcoin-$VERSION.$MINOR-win.zip.DIGESTS.txt -O darkcoin-$VERSION.$MINOR-win.zip.DIGESTS.txt
wget http://bamboo.darkcoin.qa/artifact/DRKW-GITIAN/JOB1/build-$WINDOWS_BUILD/gitian-win-darkcoin-DIGESTS/darkcoin-$VERSION.$MINOR-win32-setup.exe.DIGESTS.txt -O darkcoin-$VERSION.$MINOR-win32-setup.exe.DIGESTS.txt

#---

gpg -b --armor -u $GPG --no-emit-version darkcoin-$VERSION.$MINOR-linux.tar.gz
gpg -b --armor -u $GPG --no-emit-version darkcoin-$VERSION.$MINOR-win32-setup.exe
gpg -b --armor -u $GPG --no-emit-version darkcoin-$VERSION.$MINOR-win.zip
gpg -b --armor -u $GPG --no-emit-version darkcoin-$VERSION.$MINOR-osx.dmg

git add *
git commit -am "$VERSION.$MINOR"

