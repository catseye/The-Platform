#!/bin/sh

. /home/user/.shelf/shelf.sh

cd /home/user/catseye

PERL=perl-5.37.3
CHICKEN=chicken-4.13.0

# write out cookies

cat >$PERL/build.sh <<'EOF'
#!/bin/sh
C_INCLUDE_PATH="" ./Configure -des -Dprefix=`pwd`/install && C_INCLUDE_PATH="" make && make install
EOF
chmod 755 $PERL/build.sh

cat >$CHICKEN/build.sh <<'EOF'
#!/bin/sh
mkdir -p install && make PLATFORM=bsd PREFIX=`pwd`/install VARDIR=`pwd`/install install
EOF
chmod 755 $CHICKEN/build.sh

for line in `cat /cdrom/infrastructure.catalog`; do
  project=`echo $line | awk '{split($0,a,"@"); print a[1]}'`
  tag=`echo $line | awk '{split($0,a,"@"); print a[2]}'`
  echo "*** shelf_build $project ***"
  shelf_build $project || exit 1
  echo "*** shelf_link $project ***"
  shelf_link $project || exit 1
done

ln -s ${SHELF_FARMBASE}/bin/python3.9 ${SHELF_FARMBASE}/bin/python
