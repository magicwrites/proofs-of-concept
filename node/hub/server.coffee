express = require 'express'
http = require 'http'
socketio = require 'socket.io'

logger = require './logger'



application = express()
server = http.Server application



exports.sockets = socketio server

exports.listen = (port) ->
    server.listen port, () ->
        logger.info 'listening on port *:%s', port
