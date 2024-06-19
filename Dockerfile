# Use an official Node runtime as a parent image
FROM node:alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json for installing dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Bundle app source inside Docker image
COPY . .

# Use build arguments as environment variables
ARG AGILITY_GUID
ARG AGILITY_API_FETCH_KEY
ARG AGILITY_API_PREVIEW_KEY
ARG AGILITY_SECURITY_KEY
ARG AGILITY_LOCALES
ARG AGILITY_SITEMAP

ENV AGILITY_GUID=${AGILITY_GUID}
ENV AGILITY_API_FETCH_KEY=${AGILITY_API_FETCH_KEY}
ENV AGILITY_API_PREVIEW_KEY=${AGILITY_API_PREVIEW_KEY}
ENV AGILITY_SECURITY_KEY=${AGILITY_SECURITY_KEY}
ENV AGILITY_LOCALES=${AGILITY_LOCALES}
ENV AGILITY_SITEMAP=${AGILITY_SITEMAP}

# Build your Next.js app
RUN npm run build

# Start the Next.js app
CMD ["npm", "start"]