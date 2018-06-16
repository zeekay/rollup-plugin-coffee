# @zeekay/rollup-plugin-coffee

[![NPM version][npm-img]][npm-url] [![Build Status][travis-img]][travis-url] [![Coverage Status][coveralls-img]][coveralls-url] [![Dependency Status][dependency-img]][dependency-url] [![Gitter chat][gitter-img]][gitter-url]

A Rollup.js plugin that compiles [CoffeeScript](http://coffeescript.org/). Uses
`find-coffee` to locate the proper version of coffee-script.

## Install
```bash
$ npm install @zeekay/rollup-plugin-coffee --save-dev
```

## Usage
Add the following code to your project's `rollup.config.js`:

```js
import coffee from '@zeekay/rollup-plugin-coffee';

export default {
  entry: 'index.js',
  plugins: [
    coffee({
      // defaults
      bare:       true,
      extensions: ['.coffee', '.litcoffee'],
      version:    'auto',
      sourceMap:  true
    })
  ]
};
```

By default this plugin will use any version of CoffeeScript available, trying to
use 2.0 and falling back to 1.0 if necessary.

You can specify `version: 1` or `version: 2` to ensure a certain version is used
(or error if it's unavailable).

## License
MIT

[travis-img]:     https://img.shields.io/travis/zeekay/rollup-plugin-coffee.svg
[travis-url]:     https://travis-ci.org/zeekay/rollup-plugin-coffee
[coveralls-img]:  https://coveralls.io/repos/zeekay/rollup-plugin-coffee/badge.svg?branch=master&service=github
[coveralls-url]:  https://coveralls.io/github/zeekay/rollup-plugin-coffee?branch=master
[dependency-url]: https://david-dm.org/zeekay/rollup-plugin-coffee
[dependency-img]: https://david-dm.org/zeekay/rollup-plugin-coffee.svg
[npm-img]:        https://img.shields.io/npm/v/rollup-plugin-coffee.svg
[npm-url]:        https://www.npmjs.com/package/rollup-plugin-coffee
[gitter-img]:     https://badges.gitter.im/join-chat.svg
[gitter-url]:     https://gitter.im/zeekay/hi

<!-- not used -->
[downloads-img]:     https://img.shields.io/npm/dm/rollup-plugin-coffee.svg
[downloads-url]:     http://badge.fury.io/js/rollup-plugin-coffee
[devdependency-img]: https://david-dm.org/zeekay/rollup-plugin-coffee/dev-status.svg
[devdependency-url]: https://david-dm.org/zeekay/rollup-plugin-coffee#info=devDependencies
