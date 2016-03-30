#!/bin/bash
if [ -z "$1" ]
then
  TESTDIR="testdir"
else
  TESTDIR=$1
fi

touch $TESTDIR/1.txt
echo 'add some content' > $TESTDIR/1.txt
touch $TESTDIR/2.txt
echo 'add some content' > $TESTDIR/2.txt
echo 'append some more content' >> $TESTDIR/2.txt

mkdir --verbose $TESTDIR/3333
  touch $TESTDIR/3333/11.txt
  echo 'add some content' > $TESTDIR/3333/11.txt
  echo 'append some more content' >> $TESTDIR/3333/11.txt
  mv --verbose $TESTDIR/3333/11.txt $TESTDIR/3333/12.txt
mv --verbose $TESTDIR/3333 $TESTDIR/3334

 rm -rvf $TESTDIR/3334

 rm -rvf $TESTDIR/*
 # rm -rvf $TESTDIR
 # mkdir --verbose $TESTDIR

#rmdir -rvf testdir/
