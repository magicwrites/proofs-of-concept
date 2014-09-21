moment = require 'moment'
util = require 'util'
chalk = require 'chalk'
_ = require 'lodash'



exports.info = (message) ->
    parameters = _.flatten arguments
    parameters = parameters.slice 1

    if not _.isEmpty parameters then message = util.format message, parameters

    date = moment().format 'DD-MM-YYYY HH:mm:ss'
    dateStyled = chalk.blue date

    console.info '%s - %s', dateStyled, message
