util = require 'util'
_ = require 'lodash'

logger = require './../logger'



exports.info = (message) ->
    parameters = _.flatten arguments
    parameters = parameters.slice 1

    if not _.isEmpty parameters then message = util.format message, parameters

    message = util.format 'hub - %s', message

    logger.info message
