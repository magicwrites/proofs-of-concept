startGeneratingColors = () ->
    random = Math.random()
    number = random * 10
    rounded = Math.round number
    color = exports.configuration.colors[ rounded ]

    exports.emitter.emit 'color generated', color

    setTimeout startGeneratingColors, number * 1000



checkForTrigger = (number) ->
    trigger = parseInt exports.configuration.trigger, 10
    isTriggered = if number < trigger then yes else no

    if isTriggered then exports.emitter.emit 'colors generation start'

    response = isTriggered

exports.runUpon = (emitter, configuration) ->
    exports.emitter = emitter
    exports.configuration = configuration
    exports.emitter.when
        event: 'number generated'
        passes: checkForTrigger
        then: startGeneratingColors
