module = angular.module 'magicwrites.events', []



service = ($rootScope) ->
    # needs to be configurable
    socket = window.io ':3000'

    # needs to be configurable
    eventNames = [
        ''
    ]

    forward = (eventName) ->
        socket.on eventName, (response) ->
            $rootScope.$apply () ->
                $rootScope.$broadcast eventName, response

    forward eventName for eventName in eventNames

    exposed =
        socket: socket



module.service 'events', service
