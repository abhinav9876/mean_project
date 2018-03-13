############################################################
# Dockerfile to build MongoDB container images
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER Divyank Abhinav

################## BEGIN INSTALLATION ######################
# Install MongoDB Following the Instructions at MongoDB Docs
# Ref: http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/

# Add the package verification key
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

# Add MongoDB to the repository sources list
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list

# Update the repository sources list
RUN apt-get update

# Install MongoDB package (.deb)
RUN apt-get install -y mongodb-10gen

# Create the default data directory
RUN mkdir -p /data/db

# Install nodejs
RUN apt-get install -y nodejs

# Install npm
RUN apt-get install -y npm

# Install node
RUN apt-get install -y  nodejs-legacy

# Add project in image
ADD ./megaboilerplate-app-4 /usr/src/app





##################### INSTALLATION END #####################

# Set cusor to cwd
#RUN cd /usr/src/app

# Install NPM dependencies
RUN npm install

# ES5 / CommonJS build
#RUN npm run build

# RUN server
CMD ["node","server.js"]

# Default port to execute the entrypoint (MongoDB)
CMD ["usr/bin/mongod"]

# Set default container command
CMD ["usr/bin/mongod"]

# Set default container cmd
CMD ["mongod"]
# CMD  ["node","/usr/src/app/server.js"]

# Expose the default port
EXPOSE 3000
