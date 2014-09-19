express = require 'express'
http = require 'http'
socketio = require 'socket.io'



application = express()
server = http.Server application
sockets = socketio server


exports.sockets = sockets



    io.on 'connection', (socket) ->
        exports.emitter.emit 'user connected'
        io.emit 'user connected', socket.id

    server.listen configuration.port, () ->
        console.info 'hub - listening on port *:%s', configuration.port
