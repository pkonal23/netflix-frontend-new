# Use an official Node.js image from the Docker Hub
FROM node:14

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the Next.js app for production
RUN npm run build

# Expose the port the app runs on
EXPOSE 3000

# Define environment variables (ensure MOVIE_CATALOG_SERVICE is set)
ENV MOVIE_CATALOG_SERVICE=http://localhost:8080

# Start the app
CMD ["npm", "start"]
