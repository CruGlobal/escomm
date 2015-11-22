npm install
./node_modules/.bin/bower install
./node_modules/.bin/gulp build
rm -rf ../../public/*
mv dist/* ../../public
