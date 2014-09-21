express = require 'express'
http = require 'http'
socketio = require 'socket.io'



exports.emitter = require './hub/emitter'
exports.server = require './hub/server'



exports.run = (configuration) ->
    exports.server.sockets.on 'connection', (socket) ->
        exports.emitter.emit 'user connected'
        exports.server.sockets.emit 'user connected', socket.id

    exports.server.listen configuration.port
