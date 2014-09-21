module = angular.module 'magicwrites.events', []



service = (configuration, $rootScope) ->
    socket = window.io configuration.host + ':' + configuration.port

    forward = (eventName) ->
        socket.on eventName, (response) ->
            $rootScope.$apply () ->
                if response then response = JSON.parse response else response = null
                console.info 'event - %s', eventName, response
                $rootScope.$broadcast eventName, response

    forward eventName for eventName in configuration.events

    exposed =
        socket: socket



provider = () ->
    configuration =
        host: ''
        port: '3000'
        events: ['connect']

    this.configure = (options) ->
        options = options or {}

        if options.host is '*' then options.host = ''

        if options.host then configuration.host = options.host
        if options.port then configuration.port = options.port
        if options.events then configuration.events = options.events

    this.$get = ($rootScope) ->
        service = service configuration, $rootScope

    return null



module.provider 'events', provider
