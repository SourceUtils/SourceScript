assert = require 'assert'
{expectCompile} = require './helpers'

describe 'command', ->
  it 'should not accept a block as an argument', ->
    assert.throws ->
      expectCompile """
      normalcommand {
        cmd1
      }
      """, ""
    , (err) -> err.name is "SyntaxError" and /but "{" found/.test err.message

  it "should accept strings", ->
    expectCompile """
    command "hello world" test1 test2 "test3"
    """, """
    command "hello world" test1 test2 test3
    """
