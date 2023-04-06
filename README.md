
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
✔ How would you like to use ESLint? · problems <br>
✔ What type of modules does your project use? · commonjs <br>
✔ Which framework does your project use? · none <br>
✔ Does your project use TypeScript? · no <br>
✔ Where does your code run? · Node <br>
✔ What format do you want your config file to be in? · JavaScript <br>
</p>

<h3> Install ESLint VSCode Extension:</h3>
<h3> Add lint script to `package.json`:</h3>

```
"scripts": {
  "test": "echo \"Error: no test specified\" && exit 1",
  "lint": "eslint --config .eslintrc.js src/**"
},
```

<h3> Run Lint </h3>
```npm run lint```

<h1>CURL - JQ</h1>
<p>Install CURL and JQ on WSL(access from PowerShell)</p>

<p> Run server first! `node src/server.js`</p>
<p> run `curl localhost:8080` </p>
<p> Run `curl -s localhost:8080 | jq` to run </p>

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
`npm run debug` simple use to debug
</p>

## Auto deploy Docker Image and also ECR (AWS)
Using Github workflow to auto deploy.
