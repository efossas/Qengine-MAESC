#!/bin/sh

# validate argument
if [ $# -ne 1 ]
then
  echo "Usage: build.sh [tag]";
  exit 1;
fi

askfile () {
  bool=true;
  while $bool
  do
    read -n1 -p "$1 [Y/n] " response
    if [ "$response" = "Y" -o "$response" = "y" ]
    then
      echo ""
      response=true
      bool=false
    elif [ "$response" = "N" -o "$response" = "n" ]
    then
      echo ""
      response=false
      bool=false
    else
      echo ""; echo "Enter Y or N"
    fi
  done
  echo "$response"
}

# build which images ?
qengine=$(askfile "Build qengine ? [Y/n] ")
printf "\n"; python2=$(askfile "Build python2.7 ? [Y/n] ")
printf "\n"; sagemath=$(askfile "Build sagemath ? [Y/n] ")
printf "\n";

# build images
if $qengine; then
  cd .. && ./build.sh "$1" "localhost"
  cd -
  echo "qengine built"
fi

if $python2; then
  rm -rf docker-python2.7
  git clone https://gitlab.com/academicsystems/docker-python2.7
  if ! grep -Fxq "compose-qengine/docker-python2.7" ../.gitignore; then echo "compose-qengine/docker-python2.7" >> ../.gitignore; fi
  cd docker-python2.7 && ./build.sh "$1"
  cd .. && rm -rf docker-python2.7
  echo "python2.7 built"
fi

if $sagemath; then
  rm -rf docker-sagemath
  git clone https://gitlab.com/academicsystems/docker-sagemath
  if ! grep -Fxq "compose-qengine/docker-sagemath" ../.gitignore; then echo "compose-qengine/docker-sagemath" >> ../.gitignore; fi
  cd docker-sagemath && ./build.sh "$1"
  cd .. && rm -rf docker-sagemath
  echo "sagemath built"
fi

