moment = require 'moment'
helpers = require 'helpers'
helpers.environment.set 'development'

hub = require './hub'
colors = require './colors'
letters = require './letters'
numbers = require './numbers'

configurations =
    hub: require './../configurations/hub'
    colors: require './../configurations/colors'
    letters: require './../configurations/letters'
    numbers: require './../configurations/numbers'



originalFunctions =
    info: console.info

console.info = () ->
    date = moment().format 'DD-MM-YYYY HH:mm:ss'
    arguments[0] = date + ' - ' + arguments[0]
    originalFunctions.info.apply console, arguments



exports.run = () ->
    colors.runUpon hub.emitter, configurations.colors
    letters.runUpon hub.emitter, configurations.letters
    numbers.runUpon hub.emitter, configurations.numbers

    hub.listen configurations.hub



do exports.run
