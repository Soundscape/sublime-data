Core = require 'sublime-core'
Waterline = require 'waterline'
When = require 'when'

# Provides a data context for a given set of models
class DataContext extends Core.CoreObject
  # Construct a new DataContext
  # @param [Object] options Configuration options to be associated with the instance
  constructor: (options) ->
    super options
    @ctx = new Waterline()

  # Initialize the context with a list of models
  #
  # @param [Array] models The models / data schemas to include in the context
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
