import formatError from './format-error'
import {extname}   from 'path'
import findCoffee  from 'find-coffee'


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
    coffee = findCoffee opts.version
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
