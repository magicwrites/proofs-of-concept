startGeneratingLetters = () ->
    random = Math.random()
    number = random * 10
    rounded = Math.round number
    letter = exports.configuration.letters[ rounded ]

    exports.emitter.emit 'letter generated', letter

    setTimeout startGeneratingLetters, number * 1000



exports.runUpon = (emitter, configuration) ->
    exports.emitter = emitter
    exports.configuration = configuration

    exports.emitter.once 'user connected', () ->
        exports.emitter.emit 'letters generation starting'
        startGeneratingLetters()
