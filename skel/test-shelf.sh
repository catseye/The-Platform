#!/bin/sh

. /home/user/.shelf/shelf.sh

shelf_test() {
    cwd=`pwd`

    dir=`_shelf_abspath_dir "$1"`
    cd $dir

    # if test command is defined for this, then run it, else
    if [ -x "test.sh" ]; then
        ./test.sh
    else
        echo "No test found for this source"
    fi

    result=$?

    cd $cwd
    return $result
}

cd /home/user/catseye

for line in `cat /cdrom/infrastructure.catalog /cdrom/catseye.catalog`; do
  project=`echo $line | awk '{split($0,a,"@"); print a[1]}'`
  tag=`echo $line | awk '{split($0,a,"@"); print a[2]}'`
  echo "*** shelf_test $project ***"
  shelf_test $project || exit 1
done
