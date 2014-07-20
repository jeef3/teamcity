ParameterSet = require '../parameter-set'

class BuildStatistics extends ParameterSet
  @path '/statistics'

  @parameters [
    'ArtifactsSize'
    'BuildCheckoutTime'
    'BuildDuration'
    'BuildDurationNetTime'
    'SuccessRate'
    'TimeSpentInQueue'
  ]

module.exports = BuildStatistics
