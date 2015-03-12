(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);throw new Error("Cannot find module '"+o+"'")}var f=n[o]={exports:{}};t[o][0].call(f.exports,function(e){var n=t[o][1][e];return s(n?n:e)},f,f.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
var AbstractFactory;

AbstractFactory = (function() {
  function AbstractFactory(factoryName) {
    this.applyMembers(require(factoryName));
  }

  AbstractFactory.prototype.applyMembers = function(factoryMembers) {
    var key, memeber, results;
    results = [];
    for (key in factoryMembers) {
      memeber = factoryMembers[key];
      results.push(this[key] = memeber);
    }
    return results;
  };

  AbstractFactory.prototype.getInstanceOf = function(className, config) {
    if (!this[className]) {
      throw new Error("I've got no " + className + " in my Members!");
    }
    return new this[className](config);
  };

  return AbstractFactory;

})();

},{}]},{},[1]);

},{}]},{},[1])