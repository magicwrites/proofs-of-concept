util = require 'util'
_ = require 'lodash'
helpers = require 'helpers'



exports.info = (message) ->
    parameters = _.flatten arguments
    parameters = parameters.slice 1

    if not _.isEmpty parameters then message = util.format message, parameters

    message = util.format 'proof of concept - %s', message

    helpers.logger.info message
