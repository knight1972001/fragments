# Use node version 18.13.0
FROM node:18.13.0

LABEL maintainer="Long Nguyen <lnguyen97@myseneca.ca>"
LABEL description="Fragments node.js microservice"

# We default to use port 8080 in our service
ENV PORT=8080

# Reduce npm spam when installing within Docker
# https://docs.npmjs.com/cli/v8/using-npm/config#loglevel
ENV NPM_CONFIG_LOGLEVEL=warn

# Disable colour when run inside Docker
# https://docs.npmjs.com/cli/v8/using-npm/config#color
ENV NPM_CONFIG_COLOR=false

# # Use /app as our working directory
# WORKDIR /app

# # Copy the package.json and package-lock.json files into /app
# COPY package*.json /app/

# # Copy the package.json and package-lock.json files into the working dir (/app)
# COPY package*.json ./

# # Copy the package.json and package-lock.json files into the working dir (/app)
# COPY package.json package-lock.json ./

# # Install node dependencies defined in package-lock.json
# RUN npm install

# # Copy src to /app/src/
# COPY ./src ./src

# # Start the container by running our server
# CMD npm start

# # We run our service on port 8080
# EXPOSE 8080

# # Copy src/
# COPY ./src ./src

# # Copy our HTPASSWD file
# COPY ./tests/.htpasswd ./tests/.htpasswd

# # Run the server
# CMD npm start

#UPDATE LAB7 Dockerfile employs Docker best practices for creating Docker Images
# Build stage
# Use a lightweight Alpine Linux image as the base
FROM alpine:3.14

# Set the working directory for the image
WORKDIR /app

# Copy the package.json and package-lock.json files to the image and install dependencies
COPY package*.json ./
RUN apk add --no-cache nodejs npm && \
    npm install --production && \
    npm cache clean --force

# Copy the source code to the image
COPY . .

# Set environment variables for the image
ENV NODE_ENV=production
ENV PORT=8080

# Expose the port that the server will listen on
EXPOSE 8080

# Set the command to run when the container starts
CMD ["node", "index.js"]
#END LAB7
