require 'shortcake'

use 'cake-bundle'
use 'cake-linked'
use 'cake-outdated'
use 'cake-publish'
use 'cake-test'
use 'cake-version'

task 'clean', 'clean project', ->
  exec 'rm -rf dist'

task 'bootstrap', 'boostrap project', ->
  coffee = require 'rollup-plugin-coffee-script'

  bundle.write
    entry:  'src/index.coffee'
    dest:   'dist/bootstrap.mjs'
    format: 'es'
    compilers:
      coffee: coffee()

task 'build', 'build project', ['bootstrap'], ->
  coffee = require './'

  bundle.write
    entry: 'dist/bootstrap.mjs'
    compilers:
      coffee: coffee version: 2

task 'watch', 'watch project', ->
  build = (filename) ->
    console.log filename, 'modified, rebuilding'
    invoke 'build' if not running 'build'
  watch 'src/*.coffee',  build
  watch 'node_modules/', build, watchSymlink: true
