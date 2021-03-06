path = require 'path'
yeoman = require 'yeoman-generator'

module.exports = class <%= _.classify(generatorName) %>Generator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super
    
    @on 'end', ->
      @installDependencies skipInstall: options['skip-install']

    @pkg = JSON.parse @readFileAsString path.join __dirname, '../package.json'

  askFor: ->
    cb = @async()

    # have Yeoman greet the user.
    console.log @yeoman
    prompts = [
      type: 'confirm'
      name: 'someOption'
      message: 'Would you like to enable this option? This is just a test'
      default: true
    ]
    @prompt prompts, (props) =>
      @someOption = props.someOption
      cb()

  app: ->
    @mkdir 'app'
    @mkdir 'app/templates'
    @copy '_package.json', 'package.json'
    @copy '_bower.json', 'bower.json'

  projectfiles: ->
    @copy 'editorconfig', '.editorconfig'
    @copy 'jshintrc', '.jshintrc'
