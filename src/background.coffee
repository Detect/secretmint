chrome.browserAction.onClicked.addListener (tab) ->
  addFiles [
    'libs/jquery.min.js'
    'libs/accounting.min.js'
    'build/secret.js'
  ]

addFiles = (files) ->
  for file in files
    chrome.tabs.executeScript null, file: file
