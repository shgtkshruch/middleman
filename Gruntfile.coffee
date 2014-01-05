module.exports = (grunt) ->
  'use strict'

  grunt.initConfig
  
    # grunt-bower-task
    # https://github.com/yatskevich/grunt-bower-task
    bower:
      install:
        options:
          targetDir: './source/lib'
          layout: 'byType'
          install: true
          verbose: false
          clearnTargetDir: true
          cleanBowerDir: true

    # grunt-browser-sync
    # https://github.com/shakyshane/grunt-browser-sync
    browser_sync:
      files:
        src: ['build/index.html', 'build/stylesheets/style.css']
      options:
        server:
          baseDir: 'build'
        watchTask: false
        ghostMode:
          scroll: true
          links: true
          forms: true

    # grunt-prettify
    # https://github.com/jonschlinkert/grunt-prettify
    prettify:
      options:
        condense: true
        padcomments: false
        indent: 2
        indent_char: ' '
        indent_inner_html: 'false'
        brace_style: 'expand'
        wrap_line_length: 0
        preserve_newlines: true
        unformatted: [
          'dd'
        ]
      files:
        expand: true
        cwd: 'build'
        src: ['**/*.html']
        dest: 'build'

    # grunt-contrib-htmlmin
    # https://github.com/gruntjs/gruntcontrib-htmlmin
    htmlmin:
      options:
        removeComments: true
        collapseWhitespace: true
      files:
        expand: true
        cwd: 'build'
        src: '**/*.html'
        dest: 'build'

  grunt.registerTask 'default', [], ->
    grunt.loadNpmTasks 'grunt-bower-task'
    grunt.task.run 'bower'

  grunt.registerTask 'p', [], ->
    grunt.loadNpmTasks 'grunt-contrib-htmlmin'
    grunt.loadNpmTasks 'grunt-prettify'
    grunt.task.run 'htmlmin', 'prettify'

  grunt.registerTask 'sy', [], ->
    grunt.loadNpmTasks 'grunt-browser-sync'
    grunt.task.run 'browser_sync'

