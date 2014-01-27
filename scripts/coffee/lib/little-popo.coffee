path = require 'path'

pathToLib = ''

global.mod = (p) ->

	require path.resolve pathToLib, p

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

		unixifiedPathToLib = pathToLib.replace /[\\]+/g, '/'

		dirname = path.dirname(module.filename).replace /[\\]+/g, '/'

		unixifiedPathToTests = path.dirname(module.parent.id).replace /[\\]+/g, '/'

		errorReporter
		.skipNodeFiles()
		.skipPackage('when', 'little-popo', 'chai')
		.alias(unixifiedPathToLib, '(lib)')
		.alias(unixifiedPathToTests, '(test)')
		.skip (line) ->

			if line?.dir? and line.dir is dirname

				yes

		require('pretty-monitor').start(100, errorReporter)

		return errorReporter

	return