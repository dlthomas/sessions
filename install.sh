#!/bin/bash

: ${PREFIX:=~}
: ${ETC:=~}

if [ "${ETC%/}" = /etc ];
then : ${BASHRC:=bash.bashrc}
else : ${BASHRC:=.bashrc}
fi

cp session $PREFIX/bin/session

if ! grep -q '### LOAD COMPONENTS$' $ETC/$BASHRC; then
    sed -i.bak "\$afor component in \$(ls $ETC/.bash.d); do source $ETC/.bash.d/$component; done ### LOAD COMPONENTS" $ETC/$BASHRC
fi

if [ ! -d $ETC/.bash.d ]; then
    mkdir $ETC/.bash.d;
fi

cp session.bashrc $ETC/.bash.d


