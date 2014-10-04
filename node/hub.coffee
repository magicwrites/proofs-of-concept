helpers = require 'helpers'
logger = require './hub/logger'
configuration = require './../configurations/hub.json'



sockets =
    concept:
        letter: null
        number: null
        color: null
    users: []



exports.run = (configuration, logger) ->
    logger.info 'running'

    server = helpers.sockets.getServer logger, configuration.port

    server.sockets.on 'connection', (socket) ->
        logger.info 'connection received'

        socket.on 'introduce', (response) ->
            switch response.client
                when 'letter service' then sockets.concept.letter = socket
                when 'number service' then sockets.concept.number = socket
                when 'color service' then sockets.concept.color = socket
                when 'user' then sockets.users.push { socket: socket, user: response.user or {} }



exports.run configuration, logger
