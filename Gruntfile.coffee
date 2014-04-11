# Generated on 2014-04-04 using generator-bower 0.0.1
'use strict'

mountFolder = (connect, dir) ->
    connect.static require('path').resolve(dir)

module.exports = (grunt) ->
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)

  yeomanConfig =
    src: 'src'
    dist : 'dist'

  grunt.initConfig
    yeoman: yeomanConfig

    browserify:
      dist:
        files:
          '<%= yeoman.dist %>/flowdock.js': '.tmp/flowdock.js'
    coffee:
      dist:
        files: [
          expand: true
          cwd: '<%= yeoman.src %>'
          src: '{,*/}*.coffee'
          dest: '.tmp'
          ext: '.js'
        ]

    uglify:
      build:
        src: '<%= yeoman.dist %>/flowdock.js'
        dest: '<%= yeoman.dist %>/flowdock.min.js'

    mochaTest:
      test:
        options:
          reporter: 'spec'
          compilers: 'coffee:coffee-script'
        src: ['test/*.spec.coffee']

    grunt.registerTask 'test', ['mochaTest']

    grunt.registerTask 'build', [
      'coffee'
      'browserify'
      'uglify'
    ]

    grunt.registerTask 'default', [
      'test'
      'build'
    ]
