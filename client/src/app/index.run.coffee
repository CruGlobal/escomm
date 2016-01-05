angular.module 'escomm'
  .run (gettextCatalog) ->
    gettextCatalog.setCurrentLanguage('hu')
    gettextCatalog.debug = true
  .run ($log) ->
    'ngInject'
    $log.debug 'runBlock end'

