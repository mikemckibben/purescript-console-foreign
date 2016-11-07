"use strict";

function doLog(f, value) {
  return function () {
    if (Array.isArray(value)) {
      f.apply(console, value);
    } else {
      f.call(console, value);
    }
  };
}

exports._log = function (value) {
  return doLog(console.log, value);
};

exports._warn = function (value) {
  return doLog(console.warn, value);
};

exports._error = function (value) {
  return doLog(console.error, value);
};

exports._info = function (value) {
  return doLog(console.info, value);
};
