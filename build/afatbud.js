(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);throw new Error("Cannot find module '"+o+"'")}var f=n[o]={exports:{}};t[o][0].call(f.exports,function(e){var n=t[o][1][e];return s(n?n:e)},f,f.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
var AFatBud;

AFatBud = (function() {
  AFatBud.prototype.structure = {};

  function AFatBud(config) {
    this.config = config;
  }

  AFatBud.prototype.parseConfig = function() {
    var Factory, key, ref, results, value;
    ref = this.config;
    results = [];
    for (key in ref) {
      value = ref[key];
      if (this.isFactory(key)) {
        Factory = require(key);
        if (!Factory) {
          throw new Error("Error: Can't require " + key);
        }
        results.push(this.structure[key] = new Factory);
      } else {
        results.push(void 0);
      }
    }
    return results;
  };

  AFatBud.prototype.isFactory = function(key) {
    return /^[A-Z]/.test(key);
  };

  return AFatBud;

})();

},{}]},{},[1]);

},{}]},{},[1])