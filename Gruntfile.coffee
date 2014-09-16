'use strict'

module.exports = (grunt) ->

    configuration =
        connect:
            development:
                options:
                    base: 'front'
                    port: 2000
        watch:
            coffee:
                files: 'front/coffee/**/*.coffee'
                tasks: ['coffee']
            bower:
                files: ['front/bower.json', 'front/.bowerrc']
                tasks: ['shell:bower']
        coffee:
            compile:
                expand: yes
                cwd: 'front/coffee/'
                src: '**/*.coffee'
                dest: 'front/javascript/'
                ext: '.js'
        shell:
            bower:
                command: '(cd front && bower install --allow-root)'
                stderr: yes
                stdout: yes
                stdin: yes

    grunt.initConfig configuration

    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-connect'
    grunt.loadNpmTasks 'grunt-shell'

    grunt.registerTask 'front-setup',           ['shell:bower', 'coffee']

    grunt.registerTask 'run-public',            ['front-setup']
    grunt.registerTask 'run-development',       ['front-setup', 'connect', 'watch']

    grunt.registerTask 'default',               ['run-development']
