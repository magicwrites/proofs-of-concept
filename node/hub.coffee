express = require 'express'
http = require 'http'
socketio = require 'socket.io'



exports.emitter = require './hub/emitter'
    


exports.listen = (configuration) ->
    application = express()
    server = http.Server application
    io = socketio server

    io.on 'connection', (socket) ->
        exports.emitter.emit 'user connected'
        io.emit 'user connected', socket.id

    server.listen configuration.port, () ->
        console.info 'hub - listening on port *:%s', configuration.port
