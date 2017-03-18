import formatError from './format-error'

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

export default (opts = {}) ->
  opts.sourceMap          ?= true
  opts.bare               ?= true
  opts.extensions         ?= ['.coffee', '.litcoffee']

  {extname} = require 'path'

  if opts.version?
    coffee = findCoffee opts.version
  else
    coffee = findEither()

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
    map:  out.v3SourceMap
