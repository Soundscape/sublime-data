Core = require 'sublime-core'
Waterline = require 'waterline'
When = require 'when'

class DataContext extends Core.CoreObject
  constructor: (options) ->
    super options
    @ctx = new Waterline()

  init: (models) ->
    dfr = When.defer()

    models.forEach (model) =>
      @ctx.loadCollection model

    @ctx.initialize @options, (err, models) =>
      if err
        dfr.reject err

      @models = models.collections
      @connections = models.connections

      @emit 'ready', @
      dfr.resolve @

    dfr.promise

module.exports = DataContext
