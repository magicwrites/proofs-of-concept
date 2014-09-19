startGeneratingColors = () ->
    random = Math.random()
    number = random * 10
    rounded = Math.round number
    color = exports.configuration.colors[ rounded ]

    exports.emitter.emit 'color generated', color

    setTimeout startGeneratingColors, number * 1000



checkForTrigger = (number) ->
    trigger = parseInt exports.configuration.trigger, 10
    isTrigger = if number is trigger then yes else no

exports.runUpon = (emitter, configuration) ->
    exports.emitter = emitter
    exports.configuration = configuration
    exports.emitter.until 'number generated', checkForTrigger, startGeneratingColors
