npm install
./node_modules/.bin/bower install
./node_modules/.bin/gulp build
mkdir -p ../public
rm -rf ../public/*
mv dist/* ../public
