
exec = require('child_process').exec
fs = require 'fs'
sysPath = require 'path'

task 'compile:coffee', ->

	unless fs.existsSync './scripts/js'

		fs.mkdirSync './scripts/js'

	exec 'node ./node_modules/coffee-script/bin/coffee -bco ./scripts/js ./scripts/coffee',

		(error) ->

			if fs.existsSync '-p'

				fs.rmdirSync '-p'

			if error?

				console.log 'Compile failed: ' + error

			return

task 'build', ->

	invoke 'compile:coffee'