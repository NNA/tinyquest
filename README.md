# TinyQuest - Adventure game for kids

## Description
WARNING: this game is not working actually and still under heavy development.

## Installation
* Get the code: 
``` shell 
git clone git@github.com:NNA/tinyquest.git
```
* Install Node.js & NPM: follow [instructions](https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager)
* Download & install node dependencies: 
``` shell 
npm install
``` 
* Install formeman: 
``` shell 
gem install foreman
```

## Play the Game (on local server)
* Start Server: `foreman start`
* Browse to url: `localhost:5000`
* Enjoy your tinyquest !

## Dev & test
* Run coffeescript
``` shell 
coffee -c -w -o lib/ src/
```

* Run tests with mocha
``` shell 
./node_modules/mocha/bin/mocha -w -R spec --compilers coffee:coffee-script spec/*
```

## Coding Rules 
While coding this little game I followed these rules:
* TDD style
* Vim - I use SublimeText2 most of the time
