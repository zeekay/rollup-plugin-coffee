# rollup-plugin-coffee2 [![NPM version][npm-img]][npm-url] [![Build Status][travis-img]][travis-url] [![Coverage Status][coveralls-img]][coveralls-url] [![Dependency Status][dependency-img]][dependency-url] [![Gitter chat][gitter-img]][gitter-url]

A Rollup.js plugin that compiles [CoffeeScript 2](http://coffeescript.org/v2) (and 1).

## Install
```bash
$ npm install rollup-plugin-coffee2 --save-dev
```

## Usage
Add the following code to your project's `rollup.config.js`:

```js
import coffee2 from 'rollup-plugin-coffee2';

export default {
  entry: 'index.js',
  plugins: [
    coffee2({
      // defaults
      bare:       true,
      extensions: ['.coffee', '.litcoffee'],
      sourceMap:  true
    })
  ]
};
```

## License
MIT

[travis-img]:     https://img.shields.io/travis/zeekay/rollup-plugin-coffee2.svg
[travis-url]:     https://travis-ci.org/zeekay/rollup-plugin-coffee2
[coveralls-img]:  https://coveralls.io/repos/zeekay/rollup-plugin-coffee2/badge.svg?branch=master&service=github
[coveralls-url]:  https://coveralls.io/github/zeekay/rollup-plugin-coffee2?branch=master
[dependency-url]: https://david-dm.org/zeekay/rollup-plugin-coffee2
[dependency-img]: https://david-dm.org/zeekay/rollup-plugin-coffee2.svg
[npm-img]:        https://img.shields.io/npm/v/rollup-plugin-coffee2.svg
[npm-url]:        https://www.npmjs.com/package/rollup-plugin-coffee2
[gitter-img]:     https://badges.gitter.im/join-chat.svg
[gitter-url]:     https://gitter.im/zeekay/hi

<!-- not used -->
[downloads-img]:     https://img.shields.io/npm/dm/rollup-plugin-coffee2.svg
[downloads-url]:     http://badge.fury.io/js/rollup-plugin-coffee2
[devdependency-img]: https://david-dm.org/zeekay/rollup-plugin-coffee2/dev-status.svg
[devdependency-url]: https://david-dm.org/zeekay/rollup-plugin-coffee2#info=devDependencies
