import formatError from './format-error'
import {extname}   from 'path'


version = (coffee) ->
  parseInt (coffee.VERSION.split '.')[0], 10

# Find specific version of CoffeeScript
findCoffee = (wanted) ->
  for pkg in ['coffeescript', 'coffee-script']
    try
      coffee = require pkg
      return coffee if (version coffee) == wanted
    catch err
  throw new Error 'Unable to find CoffeeScript matching version ' + wanted

# Find either CoffeeScript version, preferring 2.0
findEither = ->
  try
    coffee = findCoffee 2
  catch err
    coffee = findCoffee 1

sourceMap = (out) ->
  if out.v3SourceMap
    JSON.parse out.v3SourceMap
  else
    null

export default (opts = {}) ->
  opts.sourceMap  ?= true
  opts.bare       ?= true
  opts.extensions ?= ['.coffee', '.litcoffee']

  try
    if opts.version?
      coffee = findCoffee opts.version
    else
      coffee = findEither()
  catch err
    return name: 'coffee2 (disabled)'

  name: 'coffee2'
  transform: (code, id) ->
    if opts.extensions.indexOf(extname id) == -1
      return null

    try
      out = coffee.compile code,
        filename:  id
        bare:      opts.bare
        sourceMap: opts.sourceMap
    catch err
      if err.location?
        err.formattedMessage = formatError code, id, err
      throw err

    code: out.js
    map:  sourceMap out
