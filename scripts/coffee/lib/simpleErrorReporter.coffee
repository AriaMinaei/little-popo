color = require './color'

processErrorMessage = (msg) ->

	"       " + msg

module.exports = reportError = (err) ->

	if err.actual?

		console.log '       Expected:'

		console.log '       "' + color(err.expected, 'yellow') + '"\n'

		console.log '       Actual:'
		console.log '       "' + color(err.actual, 'yellow') + '"\n'

	console.log '       Stack:'

	console.log color(processErrorMessage(err.stack), 'yellow')

	unless @didBeep

		`console.log("\007")`

		@didBeep = yes