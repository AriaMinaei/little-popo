chai = require 'chai'

chai.should()

global.expect = chai.expect

chai.use require 'chai-fuzzy'

chai.use require 'chai-as-promised'

chai.Assertion.includeStack = yes