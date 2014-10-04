_ = require 'lodash'
forever = require 'forever-monitor'

loggers =
    bootstrapper: require './logger'
    hub: require './hub/logger'
    services:
        letter: require './services/letter/logger'

configurations =
    hub: require './../configurations/hub.json'
    services:
        letter: require './../configurations/services/letter.json'

concept =
    hub: require './../node/hub'
    services:
        letter: require './../node/services/letter'



run = () ->
    environmentsAvailable = [ 'development', 'test', 'publishment' ]
    environment = process.argv[2] or 'development'
    environment = if _.contains environmentsAvailable, environment then environment else 'development'

    loggers.bootstrapper.info 'running modules in %s environment', environment

    options =
        command: 'coffee'
        options: [ environment ]

    concept =
        hub: new forever.Monitor 'hub.coffee', options
        services:
            letter: new forever.Monitor 'services/letter.coffee', options



do run
