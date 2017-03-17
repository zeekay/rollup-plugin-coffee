import formatError from './format-error'

export default (opts = {}) ->
  opts.sourceMap          ?= true
  opts.bare               ?= true
  opts.extensions         ?= ['.coffee', '.litcoffee']

  {extname} = require 'path'

  try
    coffee = require 'coffeescript'
  catch err
    coffee = require 'coffee-script'

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
