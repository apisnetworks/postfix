#!/bin/sh
PGSQL=/usr
MATCHES=(/usr/pgsql-*)
if [[ ${#MATCHES[@]} -gt 0 ]] ; then
  CNT=${#MATCHES[@]}
  PGSQL=${MATCHES[$CNT-1]}
  PG_VERSION=${PGSQL##*-}
fi
rpmbuild --define 'dist .apnscp' --define "pg_version $PG_VERSION"  --define "_topdir `pwd`" -ba SPECS/postfix.spec
