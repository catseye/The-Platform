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
EOF
chmod 755 otp_src_R16B03-1/build.sh

PROJECTS="
    Python-2.7.8
    make-3.82
    perl-5.20.1
    hugs98-plus-Sep2006
    otp_src_R16B03-1
    chicken-4.9.0.1
    yasm-1.3.0
    Ophis-2.1
"

for p in $PROJECTS; do
  echo "*** shelf_build $p ***"
  shelf_build $p
  echo "*** shelf_link $p ***"
  shelf_link $p
done
