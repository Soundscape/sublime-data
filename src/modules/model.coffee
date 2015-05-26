Core = require 'sublime-core'
Waterline = require 'waterline'
_ = require 'lodash'

Model =
  # Creates a Waterline data model
  #
  # @param [Object] config Configuration options for the model
  # @param [Object] attrs The schema definition
  (config, attrs) ->
    data = _.extend config, attributes: attrs
    Waterline.Collection.extend data

module.exports = Model
