// Generated by CoffeeScript 1.4.0
(function() {
  var addFiles;

  chrome.browserAction.onClicked.addListener(function(tab) {
    return addFiles(['libs/jquery.min.js', 'libs/accounting.min.js', 'build/secret.js']);
  });

  addFiles = function(files) {
    var file, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = files.length; _i < _len; _i++) {
      file = files[_i];
      _results.push(chrome.tabs.executeScript(null, {
        file: file
      }));
    }
    return _results;
  };

}).call(this);
