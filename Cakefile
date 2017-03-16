require 'shortcake'

# use 'cake-bundle'
use 'cake-publish'
use 'cake-test'
use 'cake-version'

task 'clean', 'clean project', ->
  exec 'rm -rf dist'

# task 'build', 'build project', ['bundle'], ->

task 'build', 'build project', ->
  handroll = require 'handroll'

  bundle = yield handroll.bundle
    entry:    'src/index.coffee'
    external: true

  yield bundle.write format: 'es'
  yield bundle.write format: 'cjs'

task 'watch', 'watch project', ->
  build = (filename) ->
    console.log filename, 'modified, rebuilding'
    invoke 'build' if not running 'build'
  watch 'src/*.coffee',  build
  watch 'node_modules/', build, watchSymlink: true
