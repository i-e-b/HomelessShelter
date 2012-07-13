#!bin/bash

cd ./Chef

for dir in `find . -maxdepth 1 -type d`
do
  pushd $dir
  git pull origin master
  popd
done

popd
