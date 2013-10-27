require('../lib/little-popo')()

describe "two"

it "should equal 2", ->

	2.should.equal 2

describe "three"

it "is gonna throw error", ->

	3.should.equal 2

it "should not throw error", ->

	4.should.equal 4

# Array.join 654