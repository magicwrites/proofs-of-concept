moment = require 'moment'
helpers = require 'helpers'
helpers.environment.set 'development'

logger = require './logger'

proofOfConcept =
    hub: require './hub'
    colors: require './colors'
    letters: require './letters'
    numbers: require './numbers'

configurations =
    hub: require './../configurations/hub'
    colors: require './../configurations/colors'
    letters: require './../configurations/letters'
    numbers: require './../configurations/numbers'



exports.run = () ->
    proofOfConcept.colors.runUpon proofOfConcept.hub.emitter, configurations.colors
    proofOfConcept.letters.runUpon proofOfConcept.hub.emitter, configurations.letters
    proofOfConcept.numbers.runUpon proofOfConcept.hub.emitter, configurations.numbers

    proofOfConcept.hub.run configurations.hub

    logger.info 'modules bootstrapped'



do exports.run
