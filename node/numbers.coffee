startGeneratingNumbers = () ->
    random = Math.random()
    number = random * 10
    rounded = Math.round number

    exports.emitter.emit 'number generated', rounded

    setTimeout startGeneratingNumbers, number * 1000



exports.runUpon = (emitter, configuration) ->
    exports.emitter = emitter
    exports.configuration = configuration

    exports.emitter.once 'letters generation start', () ->
        exports.emitter.emit 'numbers generation start'
        startGeneratingNumbers()
