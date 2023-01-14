# fragments

CCP555

<h1>how to run the various scripts you just created (i.e., lint, start, dev, debug).</h1>

<h1>ESLint:</h1>

<h3>How to install ESLint:</h2>

```
npm install --save-dev eslint
npx eslint --init
```

<p>You can also run this command directly using 'npm init @eslint/config'.
Need to install the following packages:
  @eslint/create-config@0.3.1
Ok to proceed? (y) y
✔ How would you like to use ESLint? · problems
✔ What type of modules does your project use? · commonjs
✔ Which framework does your project use? · none
✔ Does your project use TypeScript? · no
✔ Where does your code run? · Node
✔ What format do you want your config file to be in? · JavaScript
</p>

<h3> Install ESLint VSCode Extension:</h3>
<h3> Add lint script to `package.json`:</h3>

```
"scripts": {
  "test": "echo \"Error: no test specified\" && exit 1",
  "lint": "eslint --config .eslintrc.js src/**"
},
```

<h1> Strutured Loggin and Pino Setup </h1>
<h3> Install Pino</h3>

`npm install --save pino pino-pretty pino-http`

<h3>Create and insert in `src/logger.js`</h3>

```
// src/logger.js

// Use `info` as our standard log level if not specified
const options = { level: process.env.LOG_LEVEL || 'info' };

// If we're doing `debug` logging, make the logs easier to read
if (options.level === 'debug') {
// https://github.com/pinojs/pino-pretty
options.transport = {
target: 'pino-pretty',
options: {
colorize: true,
},
};
}

// Create and export a Pino Logger instance:
// https://getpino.io/#/docs/api?id=logger
module.exports = require('pino')(options);
```

<h1> Start, Dev, Debug </h1>
<p>
`npm run dev` is used to view or run the application worked on while in development mode to see active changes while `npm start` on the other hand cannot be run until `npm build` has been run.
`npm debug` simple use to debug
</p>
