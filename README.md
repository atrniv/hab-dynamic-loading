# Habitat Dynamic Loading 

This repo serves as an example and test for dynamic loading scenarios with Habitat.
Specifically this tests Scenario 2 described in this [issue](https://github.com/habitat-sh/core-packages/issues/56).
If you have Habitat installed, you can build and run this plan using the following commands:

# Building
```
hab pkg build .
hab pkg install ./results/<your artifact>
```

# Running
```bash
hab pkg exec core/hab-dynamic-loading app

# This should fail with something like unless you set LD_LIBRARY_PATH
# /hab/pkgs/core/hab-dynamic-loading/0.1.0/20230802093135/app/index.js:2
# const lib = koffi.load('libarchive.so');
#                   ^
# Error: Failed to load shared library: cannot open shared object file: No such file or directory
#     at Object.<anonymous> (/hab/pkgs/core/hab-dynamic-loading/0.1.0/20230802093135/app/index.js:2:19)
#     at Module._compile (internal/modules/cjs/loader.js:1085:14)
#     at Object.Module._extensions..js (internal/modules/cjs/loader.js:1114:10)
#     at Module.load (internal/modules/cjs/loader.js:950:32)
#     at Function.Module._load (internal/modules/cjs/loader.js:790:12)
#     at Function.executeUserEntryPoint [as runMain] (internal/modules/run_main.js:76:12)
#     at internal/main/run_main_module.js:17:47
```