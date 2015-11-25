assert      = require 'assert'
uridecode   = require '../'


describe 'uridecode', ->

  describe 'uridecode', ->
    it "noraml", (done) ->
      assert.equal '你好世界', uridecode(encodeURIComponent('你好世界'))
      done()


    it "gbk encoding throw exception", (done) ->
      assert.throws ->
        decodeURIComponent('%C4%E3%BA%C3')
      , Error
      done()

    it "gbk encoding uridecode enabled", (done) ->
      assert.equal(uridecode('%C4%E3%BA%C3'), '你好')
      done()
