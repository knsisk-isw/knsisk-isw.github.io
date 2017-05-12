#global module:false

"use strict"

module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-bower-task"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-exec"

  grunt.initConfig

    copy:
      jquery:
        files: [{
          expand: true
          cwd: "bower_components/jquery/dist/"
          src: "jquery.min.js"
          dest: "vendor/js/"
        }]
      jqueryrotate:
        files: [{
          expand: true
          cwd: "bower_components/jquery-rotate/"
          src: "jquery.rotate.js"
          dest: "vendor/js/"
        }]
      scrollreveal:
        files: [{
          expand: true
          cwd: "bower_components/scrollreveal/dist/"
          src: "scrollreveal.min.js"
          dest: "vendor/js/"
        }]
      velocity:
        files: [{
          expand: true
          cwd: "bower_components/velocity/"
          src: "velocity.min.js"
          dest: "vendor/js/"
        },
        {
          expand: true
          cwd: "bower_components/velocity/"
          src: "velocity.ui.min.js"
          dest: "vendor/js/"
        }]
      materialize:
        files: [{
          expand: true
          cwd: "bower_components/materialize/dist/css/"
          src: "materialize.min.css"
          dest: "vendor/css/"
        },
        {
          expand: true
          cwd: "bower_components/materialize/dist/js/"
          src: "materialize.min.js"
          dest: "vendor/js/"
        },
        {
          expand: true
          cwd: "bower_components/materialize/dist/fonts/"
          src: "roboto/*"
          dest: "vendor/fonts/"
        }]

    exec:
      jekyll:
        cmd: "jekyll build --trace"

    watch:
      options:
        livereload: true
      source:
        files: [
          "_drafts/**/*"
          "_includes/**/*"
          "_layouts/**/*"
          "_posts/**/*"
          "css/**/*"
          "js/**/*"
          "_config.yml"
          "*.html"
          "*.md"
        ]
        tasks: [
          "exec:jekyll"
        ]

    connect:
      server:
        options:
          port: 4000
          base: '_site'
          livereload: true

  grunt.registerTask "build", [
    "copy"
    "exec:jekyll"
  ]

  grunt.registerTask "serve", [
    "build"
    "connect:server"
    "watch"
  ]

  grunt.registerTask "default", [
    "serve"
  ]
