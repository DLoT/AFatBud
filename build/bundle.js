(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
var AFatBud;

AFatBud = (function() {
  AFatBud.prototype.structure = {};

  function AFatBud(AbstractFactory, config) {
    this.AbstractFactory = AbstractFactory;
    this.config = config;
  }

  AFatBud.prototype.parseConfig = function() {
    var key, ref, results, value;
    ref = this.config;
    results = [];
    for (key in ref) {
      value = ref[key];
      if (this.isFactory(key)) {
        results.push(this.structure[key] = new this.AbstractFactory(key));
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

module.exports = AFatBud;

},{}],2:[function(require,module,exports){
var AbstractFactory;

AbstractFactory = (function() {
  function AbstractFactory(factoryMembers) {
    this.applyMembers(factoryMembers);
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

module.exports = AbstractFactory;

},{}],3:[function(require,module,exports){
module.exports = {
  AFatBud: require('./AFatBud'),
  AbstractFactory: require('./AbstractFactory')
};

},{"./AFatBud":1,"./AbstractFactory":2}]},{},[3]);
