#!/bin/sh

. /home/user/.shelf/shelf.sh

cd /home/user/catseye

# write out cookies

cat >perl-5.20.1/build.sh <<'EOF'
#!/bin/sh
C_INCLUDE_PATH="" ./Configure -des -Dprefix=`pwd`/install && C_INCLUDE_PATH="" make && make install
EOF
chmod 755 perl-5.20.1/build.sh

cat >chicken-4.9.0.1/build.sh <<'EOF'
#!/bin/sh
mkdir -p install && make PLATFORM=bsd PREFIX=`pwd`/install VARDIR=`pwd`/install install
EOF
chmod 755 chicken-4.9.0.1/build.sh

cat >otp_src_R16B03-1/build.sh <<'EOF'
#!/bin/sh
rm -rf lib/cos* && touch lib/asn1/SKIP lib/eldap/SKIP lib/gs/SKIP lib/hipe/SKIP lib/inets/SKIP lib/jinterface/SKIP lib/megaco/SKIP lib/orber/SKIP lib/odbc/SKIP lib/erlang && ./configure --prefix=`pwd` --disable-threads --disable-hipe --without-ssl && make
find . -name dirname -exec rm {} \;
EOF
chmod 755 otp_src_R16B03-1/build.sh

for line in `cat /cdrom/infrastructure.catalog`; do
  project=`echo $line | awk '{split($0,a,"@"); print a[1]}'`
  tag=`echo $line | awk '{split($0,a,"@"); print a[2]}'`
  echo "*** shelf_build $project ***"
  shelf_build $project || exit 1
  echo "*** shelf_link $project ***"
  shelf_link $project || exit 1
done

ln -s ${SHELF_FARMBASE}/bin/python2.7 ${SHELF_FARMBASE}/bin/python
