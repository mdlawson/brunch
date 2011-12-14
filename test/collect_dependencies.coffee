{StitchCompiler} = require '../src/compilers'


describe 'brunch dependencies', ->
  it 'should be collected', ->
    options =
      dependencies: [
        'console-helper.js'
        'jquery-1.7.js'
        'underscore-1.1.7.js'
        'backbone-0.5.3.js'
      ]
      rootPath: 'test/fixtures/base'
    compiler = new StitchCompiler options
    dependencyPaths = compiler.collect 'vendor'
    dependencyPaths.should.eql [
      'test/fixtures/base/vendor/scripts/console-helper.js',
      'test/fixtures/base/vendor/scripts/jquery-1.7.js',
      'test/fixtures/base/vendor/scripts/underscore-1.1.7.js',
      'test/fixtures/base/vendor/scripts/backbone-0.5.3.js'
    ]

  it 'should include backbone-localstorage and ignore dotfiles / dirs', ->
    options =
      dependencies: [
        'console-helper.js'
        'jquery-1.7.js'
        'underscore-1.1.7.js'
        'backbone-0.5.3.js'
        'backbone-localstorage.js'
      ]
      rootPath: 'test/fixtures/alternate_base'
    compiler = new StitchCompiler options
    dependencyPaths = compiler.collect 'vendor'
    dependencyPaths.should.eql [
      'test/fixtures/alternate_base/vendor/scripts/console-helper.js'
      'test/fixtures/alternate_base/vendor/scripts/jquery-1.7.js'
      'test/fixtures/alternate_base/vendor/scripts/underscore-1.1.7.js'
      'test/fixtures/alternate_base/vendor/scripts/backbone-0.5.3.js'
      'test/fixtures/alternate_base/vendor/scripts/backbone-localstorage.js'
    ]