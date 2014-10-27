#!/usr/bin/env bash

files=$(shopt -s nullglob dotglob; echo *)

if (( ${#files} ))
then
  echo "Please run this in an empty dir!" && exit 1
else
  declare -a generators=(
  	generator-angular
  	generator-backbone
  	generator-bootstrap
  	generator-chrome-extension
  	generator-chromeapp
  	generator-commonjs
  	generator-dummy
  	generator-ember
  	generator
  	generator-gruntfile
  	generator-gruntplugin
  	generator-gulp-webapp
  	generator-jasmine
  	generator-jquery
  	generator-karma
  	generator-mobile
  	generator-mocha
  	generator-node
  	generator-polymer
  	generator-webapp
  )

  for gen in "${generators[@]}"; do
    echo "Clonning generator-$gen..."
    git clone "https://github.com/yeoman/$gen.git"
  done
  echo "Done! Enjoy :-)"
fi
