moment = require 'moment'
helpers = require 'helpers'
helpers.environment.set 'development'

logger = require './logger'
hub = require './hub'
colors = require './colors'
letters = require './letters'
numbers = require './numbers'

configurations =
    hub: require './../configurations/hub'
    colors: require './../configurations/colors'
    letters: require './../configurations/letters'
    numbers: require './../configurations/numbers'



exports.run = () ->
    colors.runUpon hub.emitter, configurations.colors
    letters.runUpon hub.emitter, configurations.letters
    numbers.runUpon hub.emitter, configurations.numbers

    hub.run configurations.hub

    logger.info 'modules bootstrapped'



do exports.run
