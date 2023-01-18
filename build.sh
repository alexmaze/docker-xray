XRAY_VERSION=1.7.2
# XRAY_PLATFORM: https://github.com/xtls/Xray-core/releases
# e.g. linux-64 / linux-arm64-v8a
XRAY_PLATFORM=linux-64

filename=Xray-${XRAY_PLATFORM}.zip
tagname=${XRAY_VERSION}-${XRAY_PLATFORM}
workdir=$(pwd)
tmpdir=${workdir}/tmp

mkdir $tmpdir && cd $tmpdir

wget https://github.com/XTLS/Xray-core/releases/download/v${XRAY_VERSION}/${filename}
unzip $filename
rm $filename

cd $workdir

docker build --tag alexmaze/xray:$tagname $workdir
docker push alexmaze/xray:$tagname

rm -rf $tmpdir
