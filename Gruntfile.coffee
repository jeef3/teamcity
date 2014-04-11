'use strict'

mountFolder = (connect, dir) ->
    connect.static require('path').resolve(dir)

module.exports = (grunt) ->
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)

  yeomanConfig =
    src: 'src'
    dist : 'lib'

  grunt.initConfig
    yeoman: yeomanConfig

    coffee:
      dist:
        files: [
          expand: true
          cwd: '<%= yeoman.src %>'
          src: '{,*/}*.coffee'
          dest: '<%= yeoman.dist %>'
          ext: '.js'
        ]

    mochaTest:
      test:
        options:
          reporter: 'spec'
          compilers: 'coffee:coffee-script'
        src: ['test/*.spec.coffee']

    grunt.registerTask 'test', ['mochaTest']

    grunt.registerTask 'build', [
      'coffee'
    ]

    grunt.registerTask 'default', [
      'test'
      'build'
    ]
