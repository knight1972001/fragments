// src/authorization/index.js

// Prefer Amazon Cognito
// in docker-asdf.yml
if (process.env.AWS_COGNITO_POOL_ID && process.env.AWS_COGNITO_CLIENT_ID) {
  console.log('Using JWT');
  module.exports = require('./cognito');
}
// Also allow for an .htpasswd file to be used, but not in production
else if (process.env.HTPASSWD_FILE && process.NODE_ENV !== 'production') {
  console.log('Using basicAuth');
  module.exports = require('./basic-auth');
}
// In all other cases, we need to stop now and fix our config
else {
  throw new Error('missing env vars: no authorization configuration found');
}

// if (process.env.HTPASSWD_FILE && process.NODE_ENV !== 'production') {
//   module.exports = require('./basic-auth');
// }
