events = require 'events'
util = require 'util'

logger = require './logger'



emitter = new events.EventEmitter



originalFunctions =
    emit: emitter.emit



emitter.emit = (eventName, data) ->
    data = if data then JSON.stringify data else 'no data'
    message = util.format 'emitted %s, %s', eventName, data

    logger.info message
    originalFunctions.emit.apply emitter, arguments

emitter.when = (defined) ->
    if not defined.event then throw new Error 'missing tested event'
    if not defined.passes then throw new Error 'missing event data tester'
    if not defined.then then throw new Error 'missing callback function'

    emitter.once defined.event, (data) ->
        if defined.passes data then defined.then data else emitter.when defined



module.exports = emitter
