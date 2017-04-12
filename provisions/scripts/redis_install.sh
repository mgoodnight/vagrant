#!/bin/bash
echo "Start - Install redis script"

REDIS_URI="http://download.redis.io/redis-stable.tar.gz"
REDIS_DISTROOT="/home/vagrant/dist/redis"
REDIS_DISTDIR="$REDIS_DISTROOT/redis-stable"
REDIS_TARFILE="redis.tar.gz"
REDIS_BUILD_SKIP="RedisBuildSkipSentinel"

[ -d $REDIS_DISTROOT ] || mkdir -p $REDIS_DISTROOT

cd $REDIS_DISTROOT

curl -L -o $REDIS_TARFILE  $REDIS_URI
tar xzf $REDIS_TARFILE
rm $REDIS_TARFILE

cd $REDIS_DISTDIR
make
make test
sudo make install

cd $REDIS_DISTDIR/utils
#... Run install_server and use defaults for all user prompts
echo '' | sudo ./install_server.sh

echo "Done - Install redis script"
