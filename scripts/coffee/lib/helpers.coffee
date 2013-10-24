purify = (obj) ->

	if typeof obj isnt 'object' then return obj

	ret = {}

	for own key, val of obj

		continue if key in ['prev', 'next', 'parent', 'attribs', 'length']

		continue if val instanceof Function

		ret[key] = purify val

	ret

global.inspectDom = (obj) ->

	inspect purify obj

global.inspect = require('eyespect').inspector pretty: yes, maxLength: 10200

delay = require 'when/delay'

global.after = (ms, cb) ->

	delay(ms).then -> do cb