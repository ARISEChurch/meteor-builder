set -x

mkdir -p build
rm -rf build/bundle
meteor build --server=${ROOT_URL} --directory build
cd build/bundle/programs/server
npm install --production
