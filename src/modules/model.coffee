Core = require 'sublime-core'
Waterline = require 'waterline'
_ = require 'lodash'

Model = (config, attrs) ->
  data = _.extend config, attributes: attrs
  Waterline.Collection.extend data

module.exports = Model
