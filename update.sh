
LINUX_BUILD=37
MAC_BUILD=37
WINDOWS_BUILD=42
VERSION='0.10.17.26'
GPG='986FF288'

rm darkcoin-*

wget http://bamboo.darkcoin.qa/browse/DRKL-GITIAN-$LINUX_BUILD/artifact/JOB1/gitian-linux-darkcoin-dist/darkcoin-$VERSION-linux.tar.gz -O darkcoin-$VERSION-linux.tar.gz
wget http://bamboo.darkcoin.qa/browse/DRKL-GITIAN-$LINUX_BUILD/artifact/JOB1/gitian-linux-darkcoin-DIGESTS/darkcoin-$VERSION-linux.tar.gz.DIGESTS.txt -O darkcoin-$VERSION-linux.tar.gz.DIGESTS.txt

#---

wget http://bamboo.darkcoin.qa/browse/DRKM-GITIAN-$MAC_BUILD/artifact/JOB1/gitian-osx-darkcoin-dist/darkcoin-$VERSION-osx.dmg -O darkcoin-$VERSION-osx.dmg
wget http://bamboo.darkcoin.qa/browse/DRKM-GITIAN-$MAC_BUILD/artifact/JOB1/gitian-osx-darkcoin-DIGESTS/darkcoin-$VERSION-osx.dmg.DIGESTS.txt -O darkcoin-$VERSION-osx.dmg.DIGESTS.txt

#---

wget http://bamboo.darkcoin.qa/browse/DRKW-GITIAN-$WINDOWS_BUILD/artifact/JOB1/gitian-win-darkcoin-dist/darkcoin-$VERSION-win.zip -O darkcoin-$VERSION-win.zip
wget http://bamboo.darkcoin.qa/artifact/DRKW-GITIAN/JOB1/build-$WINDOWS_BUILD/gitian-win-darkcoin-bin/32/darkcoin-$VERSION-win32-setup.exe -O darkcoin-$VERSION-win32-setup.exe
wget http://bamboo.darkcoin.qa/artifact/DRKW-GITIAN/JOB1/build-$WINDOWS_BUILD/gitian-win-darkcoin-DIGESTS/darkcoin-$VERSION-win.zip.DIGESTS.txt -O darkcoin-$VERSION-win.zip.DIGESTS.txt
wget http://bamboo.darkcoin.qa/artifact/DRKW-GITIAN/JOB1/build-$WINDOWS_BUILD/gitian-win-darkcoin-DIGESTS/darkcoin-$VERSION-win32-setup.exe.DIGESTS.txt -O darkcoin-$VERSION-win32-setup.exe.DIGESTS.txt

#---

gpg -b --armor -u $GPG --no-emit-version darkcoin-$VERSION-linux.tar.gz
gpg -b --armor -u $GPG --no-emit-version darkcoin-$VERSION-win32-setup.exe
gpg -b --armor -u $GPG --no-emit-version darkcoin-$VERSION-win.zip
gpg -b --armor -u $GPG --no-emit-version darkcoin-$VERSION-osx.dmg

git add *
git commit -am "$VERSION"
