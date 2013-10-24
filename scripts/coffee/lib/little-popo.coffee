path = require 'path'

pathToLib = ''
# pathToLib = path.resolve __dirname, '../../js/lib'

module.exports = (p) -> pathToLib = p

global.mod = (p) ->

	require path.resolve pathToLib, p

require 'when/monitor/console'

TestRunner = require './TestRunner'

tests = new TestRunner

global.test = global.it = tests.test.bind tests

global.test.skip = global._test = global._it = tests.skip.bind tests

global.describe = tests.describe.bind tests

require './assertions'

require './helpers'

process.on 'exit', ->

	tests.checkDone()

	console.log "\n\n"