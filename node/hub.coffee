exports.emitter = require './hub/emitter'
exports.server = require './hub/server'



exports.run = (configuration) ->
    exports.emitter.on 'number generated', (number) ->
        exports.server.sockets.emit 'number generated', number

    exports.emitter.on 'letter generated', (letter) ->
        exports.server.sockets.emit 'letter generated', letter

    exports.emitter.on 'color generated', (color) ->
        exports.server.sockets.emit 'color generated', color

    exports.server.sockets.on 'connection', (socket) ->
        exports.emitter.emit 'user connected'

        socket.on 'numbers generation start', () ->
            exports.emitter.emit 'numbers generation start'

    exports.server.listen configuration.port
