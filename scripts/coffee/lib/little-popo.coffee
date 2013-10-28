path = require 'path'

pathToLib = ''
# pathToLib = path.resolve __dirname, '../../js/lib'



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



module.exports = (p, usePrettyError = yes) ->

	pathToLib = p

	if usePrettyError

		PrettyError = require 'pretty-error'

		errorReporter = new PrettyError

		errorReporter.appendStyle 'pretty-error': marginLeft: 7

		tests.setErrorReporter (error) ->

			errorReporter.render(error, yes)