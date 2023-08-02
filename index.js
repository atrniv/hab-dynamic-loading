const koffi = require('koffi');

// This will not succeed unless you modify LD_LIBRARY_PATH (Linux) / DYLD_LIBRARY_PATH (MacOS) / PATH (Windows)
const lib = koffi.load('libarchive.so');

console.log("Success");