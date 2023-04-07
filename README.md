
1.	Added:
a.	Fixing POST /fragments to receive more kind of type
b.	Added GET /fragments?expand=1 to Gets all fragments belonging to the current user expanded to include a full representation of the fragments' metadata. Added Fragments Card to fragments UI to able see fragment data of each fragments belongs a User.
c.	GET /fragments/:id now return expected Content-Type with unit Test
d.	GET /fragments/:id.ext now return the fragment’s data was converted to a supported type. Also show to the fragments UI.
e.	Added Unit test for new function and deployed to Docker and ECR.
2.	Github Link:
a.	Fragments Github: https://github.com/knight1972001/fragments
b.	Fragments UI Github: https://github.com/knight1972001/fragments-ui
3.	Docker Link:
a.	Docker hub: https://hub.docker.com/repository/docker/knight1972001/fragments/general
b.	Built Image Docker: https://hub.docker.com/layers/knight1972001/fragments/latest/images/sha256-2bff11a01e8600bd1d364e6f59bd45822a059f23074d1cc685d54e2dc6be52ba?context=repo
4.	Link to a successful GitHub Actions CI workflow running your unit tests
a.	CI: https://github.com/knight1972001/fragments/actions/runs/4443122277
b.	CD: https://github.com/knight1972001/fragments/actions/runs/4443122295
5.	Screenshots of your fragments API server running as a container on EC2 based on your Docker Hub image
 ![image](https://user-images.githubusercontent.com/60019805/230248111-ed5b6b2f-9d6b-4009-ac7b-e8569a7c80ef.png)
 

6.	Screenshots of your fragments-ui web app
a.	User authenticating with Cognito Hosted UI and showing the metadata for all of their existing fragments
 ![image](https://user-images.githubusercontent.com/60019805/230248148-88f89f87-cbda-438a-a60b-1d47c4ee2ad4.png)
![image](https://user-images.githubusercontent.com/60019805/230248152-0743744b-404f-487a-a762-c5b25d3ba43f.png)

b.	User creating a new JSON fragment
 ![image](https://user-images.githubusercontent.com/60019805/230248165-699e6817-b2a6-4666-a696-b4880fb07b4e.png)
![image](https://user-images.githubusercontent.com/60019805/230248171-0e368c91-08ee-418c-b711-8470c07018de.png)

c.	User creating a new Markdown fragment
 ![image](https://user-images.githubusercontent.com/60019805/230248178-995a24d5-0c66-4d79-bfed-aecb9c017dd1.png)
![image](https://user-images.githubusercontent.com/60019805/230248190-0af1aae1-616b-4313-95b3-851922dd6275.png)

d.	Make sure at least one of the screenshots shows the Location header being set and returned correctly
 ![image](https://user-images.githubusercontent.com/60019805/230248229-4a60993a-142e-4444-85c5-9d3be858c493.png)

7.	Screenshot of running npm run coverage
 ![Uploading image.png…]()

8.	A conclusion, including a discussion about any bugs or issues that you still need to address in the final release.
During assignment 2, I do not face significant bugs or huge issues. However, when doing fragments UI, I'm facing the problem that I tried to POST with the content type. But unlucky, using set header cannot do it because I also need to pass the user.authorizationHeaders in headers. I wonder why I can use Postman and Curl to test the POST with content type but why I cannot use fetch. So I think headers might not be set in the content type. Using console.log to debug and read the response from POST, I knew Content-Type was always 'application/json'. So I use another format
`const headers = Object.assign({}, user.authorizationHeaders(), { "Content-Type": contentType });
    const res = await fetch(`${apiUrl}/v1/fragments`, {
      method: "POST",
      headers: headers,
      body: data
    });
` 
To set the headers, and now it's working.

I use new route fragments/:id/info to identify the fragment's content type. Then I can show its correct formats like JSON, HTML or text. Fragments Card from fragment-ui also generated with an event on click with (this.id) that will help me to know which fragment card was clicked. Then I can show exact data from that card.  

There are a few things to do when deploying to GitHub because I finished them from labs 6 and 7. Everything is auto-deployed to Docker Hub and ECR. I only need to pull the image from ECR to EC2, then run with the normal docker run. It took an hour to understand how's ECR and EC2 work (due to the last lab, I do not really understand how it's working). 

For the last release, I am thinking about the screen from fragment-ui that can show anything from fragments data in the small frame (if it's an image or HTML extension). Also, I need to pay more time finishing the convert ext between extension files. So the app can be more perfectly.


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
