require('../lib/little-popo')()

wn = require 'when'

describe "two"

it "should equal 32", ->

	2.should.equal 2

describe "three"

it "is gonna throw error", ->

	3.should.equal 2

it "should not throw error", ->

	4.should.equal 4

it "should produce an unhandled rejection", ->

	wn().then ->

		throw Error "a"

	return

# Array.join 654