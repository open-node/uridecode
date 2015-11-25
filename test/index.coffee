assert      = require 'assert'
uridecode   = require '../'


describe 'uridecode', ->

  describe 'uridecode', ->
    it "noraml", (done) ->
      assert.throws ->
        cache.get('name')
      , Error
      done()


    it "gbk encoding", (done) ->
      assert.throws ->
        cache.set('name', new Date, 10)
      , Error
      done()

