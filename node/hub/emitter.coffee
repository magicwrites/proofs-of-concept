events = require 'events'



emitter = new events.EventEmitter



originalFunctions =
    emit: emitter.emit



emitter.emit = (eventName, data) ->
    jsonized = JSON.stringify data, null, 4
    prefix = 'hub - event - %s'
    if jsonized then console.info prefix + ' - %s', eventName, jsonized else console.info prefix, eventName
    originalFunctions.emit.apply emitter, arguments

emitter.until = (eventName, conditionTester, callback) ->
    emitter.once eventName, (data) ->
        if conditionTester data then callback() else emitter.until eventName, conditionTester, callback



module.exports = emitter
