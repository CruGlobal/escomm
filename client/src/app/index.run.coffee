angular.module 'escomm'
  .run (gettextCatalog, $window) ->
    gettextCatalog.debug = true
    DEFAULT_VALUE = 'en'
    PREFERRED_LANGUAGE = $window.navigator.language || $window.navigator.userLanguage || $window.navigator.browserLanguage ||
    $window.navigator.systemLanguage || DEFAULT_VALUE
    res = PREFERRED_LANGUAGE.split("-")
    console.log("PREFERRED_LANGUAGE: " + res[0])
    gettextCatalog.setCurrentLanguage(res[0])
    gettextCatalog.debug = true
  .run ($log) ->
    'ngInject'
    $log.debug 'runBlock end'

