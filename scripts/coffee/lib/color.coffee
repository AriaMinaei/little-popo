codes = off: 0, red: 31, green: 32, yellow: 33, blue: 34

# https://github.com/loopj/commonjs-ansi-color
module.exports = (str, color) ->

	str = "\u001b[" + codes[color] + "m" +

	str + "\u001b[" + codes.off + "m"

	str