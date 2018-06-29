#!/bin/sh

CFLAGS='-O2 -g -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-strong -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection'

CXXFLAGS='-O2 -g -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-strong -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection'

FFLAGS='-O2 -g -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-strong -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection -I/usr/lib64/gfortran/modules'

FCFLAGS='-O2 -g -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-strong -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection -I/usr/lib64/gfortran/modules'

LDFLAGS='-Wl,-z,relro  -Wl,-z,now -specs=/usr/lib/rpm/redhat/redhat-hardened-ld'

# The build is success with the options.
# /usr/bin/cmake \
#   -DCMAKE_C_FLAGS_RELEASE:STRING=-DNDEBUG \
#   -DCMAKE_CXX_FLAGS_RELEASE:STRING=-DNDEBUG \
#   -DCMAKE_Fortran_FLAGS_RELEASE:STRING=-DNDEBUG \
#   -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
#   -DCMAKE_INSTALL_PREFIX:PATH=/usr \
#   -DINCLUDE_INSTALL_DIR:PATH=/usr/include \
#   -DLIB_INSTALL_DIR:PATH=/usr/lib64 \
#   -DSYSCONF_INSTALL_DIR:PATH=/etc \
#   -DSHARE_INSTALL_PREFIX:PATH=/usr/share \
#   -DLIB_SUFFIX=64 \
#   -DBUILD_SHARED_LIBS:BOOL=ON \
#   . \
#   -DCMAKE_BUILD_TYPE=RelWithDebInfo \
#   -DCMAKE_SYSTEM_PROCESSOR=x86_64 \
#   -DMARIADB_UNIX_ADDR=/var/lib/mysql/mysql.sock \
#   -DMARIADB_PORT=3306 \
#   -DWITH_EXTERNAL_ZLIB=YES \
#   -DWITH_SSL=OPENSSL \
#   -DWITH_MYSQLCOMPAT=ON \
#   -DINSTALL_LAYOUT=RPM \
#   -DCMAKE_INSTALL_PREFIX=/usr \
#   -DINSTALL_BINDIR=bin \
#   -DINSTALL_LIBDIR=lib64 \
#   -DINSTALL_INCLUDEDIR=include/mysql \
#   -DINSTALL_PLUGINDIR=lib64/mariadb/plugin \
#   -DWITH_UNITTEST=ON

/usr/bin/cmake \
  -DCMAKE_C_FLAGS_RELEASE:STRING=-DNDEBUG \
  -DCMAKE_CXX_FLAGS_RELEASE:STRING=-DNDEBUG \
  -DCMAKE_Fortran_FLAGS_RELEASE:STRING=-DNDEBUG \
  -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
  -DLIB_SUFFIX=64 \
  -DBUILD_SHARED_LIBS:BOOL=ON \
  . \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_SYSTEM_PROCESSOR=x86_64 \
  -DMARIADB_UNIX_ADDR=/var/lib/mysql/mysql.sock \
  -DMARIADB_PORT=3306 \
  -DWITH_EXTERNAL_ZLIB=YES \
  -DWITH_SSL=OPENSSL \
  -DWITH_MYSQLCOMPAT=ON \
  -DINSTALL_LAYOUT=RPM \
  -DCMAKE_INSTALL_PREFIX=$(pwd)/dist \
  -DWITH_UNITTEST=ON

make -j4

# $ make install DESTDIR=/builddir/build/BUILDROOT/mariadb-connector-c-3.0.5-1.fc28.x86_64
# $ make install DESTDIR=$(pwd)/dist

rm -rf dist
make install
# $ ls dist/
# bin/  include/  lib64/
