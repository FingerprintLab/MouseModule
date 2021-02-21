This is the code I'm trying to run on the Raspberry Pi:  

```javascript
let options = {
        gpiomem: false,
        mapping: 'physical',
        mock: undefined,
        close_on_exit: true,
}

const rpio = require("rpio");
rpio.init(options);
```
And the error I get from node when trying to run the script with sudo is the following:
```
<path>/node_modules/bindings/bindings.js:121
        throw e;
        ^

Error: The module '<path>/node_modules/rpio/build/Release/rpio.node'
was compiled against a different Node.js version using
NODE_MODULE_VERSION 83. This version of Node.js requires
NODE_MODULE_VERSION 64. Please try re-compiling or re-installing
the module (for instance, using `npm rebuild` or `npm install`).
    at Object.Module._extensions..node (internal/modules/cjs/loader.js:807:18)
    at Module.load (internal/modules/cjs/loader.js:653:32)
    at tryModuleLoad (internal/modules/cjs/loader.js:593:12)
    at Function.Module._load (internal/modules/cjs/loader.js:585:3)
    at Module.require (internal/modules/cjs/loader.js:692:17)
    at require (internal/modules/cjs/helpers.js:25:18)
    at bindings (<path>/node_modules/bindings/bindings.js:112:48)
    at Object.<anonymous> (<path>/node_modules/rpio/lib/rpio.js:17:34)
    at Module._compile (internal/modules/cjs/loader.js:778:30)
    at Object.Module._extensions..js (internal/modules/cjs/loader.js:789:10)
```
I'v tried `npm rebuild` and `npm install`, I have also deleted manually the node_modules folder and reinstalled the rpio library but it did not solve my problem.  
Scripts that handle GPIO functions show no problems but now I'm interested in PWM so the the `gpiomem` falg must be set to `false` in my case.  

---

Hardware: Raspberry PI 3 Model B+  
Node: v14.15.4  
NPM: v6.14.10  