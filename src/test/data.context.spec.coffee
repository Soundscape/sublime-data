Core = require 'sublime-core'
mongo = require 'sails-mongo'
lib = require '../'

describe 'DataContext test suite', ()  ->
  cfg =
    adapters:
      'default': mongo
      mongo: mongo

    connections:
      mongo:
        adapter: 'mongo'
        host: 'localhost'
        port: 27017
        database: 'sublime-db'

    defaults:
      migrate: 'drop'

  ctx = new lib.DataContext cfg
  models = []

  it 'should create the context', () ->
    expect(ctx).not.toBeNull()

  it 'should register models', () ->
    cfg =
      identity: 'user'
      connection: 'mongo'

    schema =
      first_name: 'string'
      last_name: 'string'

    model = new lib.Model cfg, schema
    expect(model).not.toBeNull()

    models.push model
    expect(models.length).toBe 1

  it 'should load the models', (done) ->
    ctx.init models
    .then () ->
      expect(ctx.models).not.toBeNull()
      done()

  it 'should query models', (done) ->
    expect(ctx).not.toBeNull()
    expect(ctx.models).not.toBeNull()

    ctx.models.user.find().exec (err, models) ->
      expect(err).toBeNull()
      expect(models.length).toBe 0
      done()
