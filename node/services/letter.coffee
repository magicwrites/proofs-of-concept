helpers = require 'helpers'
logger = require './letter/logger'
configuration = require './../../configurations/services/letter.json'



startGeneratingLetters = () ->
    random = Math.random()
    number = random * 10
    rounded = Math.round number
    letter = configuration.letters[ rounded ]

    exports.clients.hub.socket.emit 'letter generated', letter
    logger.info 'generated letter %s', letter

    setTimeout startGeneratingLetters, rounded * 1000



exports.run = (environment) ->
    logger.info 'running in %s configuration', environment

    exports.server = helpers.sockets.getServer logger, configuration.ports.services.letter

    exports.clients =
        hub: helpers.sockets.getClient logger, configuration.ports.hub

    exports.server.sockets.on 'connection', (socket) ->
        logger.info 'connection received'

    exports.clients.hub.socket.on 'connect', () ->
        logger.info 'connected to the hub'

        exports.clients.hub.socket.emit 'introduce',
            client: 'letter service'

        startGeneratingLetters()



exports.run process.argv[2]
