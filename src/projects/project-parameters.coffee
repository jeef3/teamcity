class ProjectParameters extends ParameterSet

  @path '/parameters'

  @parameters [
    'startDate'
    'finishDate'
  ]

  constructor: (@client, @parent) ->
