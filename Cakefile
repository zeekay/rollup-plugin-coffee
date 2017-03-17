require 'shortcake'

use 'cake-bundle'
use 'cake-publish'
use 'cake-test'
use 'cake-version'

task 'clean', 'clean project', ->
  exec 'rm -rf dist'

task 'build', 'build project', ->
  bundle.write
    entry:   'src/index.coffee'
    formats: ['es', 'cjs']

task 'watch', 'watch project', ->
  build = (filename) ->
    console.log filename, 'modified, rebuilding'
    invoke 'build' if not running 'build'
  watch 'src/*.coffee',  build
  watch 'node_modules/', build, watchSymlink: true
