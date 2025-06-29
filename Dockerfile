# Use the official Node.js image as the base image.
# 'lts-alpine' refers to the Long Term Support (LTS) version, based on the lightweight Alpine Linux.
FROM node:lts-alpine

# Set the working directory inside the container to /app.
# All subsequent commands will be executed relative to this directory.
WORKDIR /app

# Copy package.json and package-lock.json (if it exists) into the working directory.
# This step is done separately to leverage Docker's caching,
# so npm install is only re-run if these files change.
COPY package*.json ./

# Install project dependencies.
# '--production' flag ensures only production dependencies are installed, keeping the image smaller.
RUN npm install --production

# Copy the entire application source code into the working directory.
# This happens after dependencies are installed, again to optimize caching.
COPY . .

# Expose port 3000.
# This informs Docker that the container listens on the specified network port at runtime.
# It doesn't actually publish the port; it's more for documentation and network configuration.
EXPOSE 3000

# Define the command to run when the container starts.
# This command executes the 'start' script defined in your package.json.
CMD ["npm", "start"]