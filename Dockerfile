# Use official Node.js LTS image
FROM node:18-alpine AS deps

# Set working directory
WORKDIR /app

# Copy dependency files from app folder
COPY Mindmend_Chatrooms/package.json Mindmend_Chatrooms/package-lock.json* ./

# Install dependencies
RUN npm install

# Copy the rest of the app from subfolder
COPY Mindmend_Chatrooms .

# Build the Next.js app
RUN npm run build

# Expose the port Next.js will run on
EXPOSE 3000

# Start the production server
CMD ["npm", "start"]
