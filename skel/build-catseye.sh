#!/bin/sh

. /home/user/.shelf/shelf.sh

cd /home/user/catseye

# write out cookies

cat >Whothm/build.sh <<'EOF'
#!/bin/sh
echo "No javac. Does not build here."
EOF
chmod 755 Whothm/build.sh

cat >yoob/build.sh <<'EOF'
#!/bin/sh
echo "No javac. Does not build here."
EOF
chmod 755 yoob/build.sh

cat >Tamsin/test.sh <<'EOF'
#!/bin/sh
echo "No python2.7. Cannot run tests here."
EOF
chmod 755 Tamsin/test.sh

cat >ellsync/test.sh <<'EOF'
#!/bin/sh
echo "No rsync. Cannot run tests here."
EOF
chmod 755 ellsync/test.sh

for line in `cat /cdrom/catseye.catalog`; do
  project=`echo $line | awk '{split($0,a,"@"); print a[1]}'`
  tag=`echo $line | awk '{split($0,a,"@"); print a[2]}'`
  echo "*** shelf_build $project ***"
  shelf_build $project || exit 1
  echo "*** shelf_link $project ***"
  shelf_link $project || exit 1
done
