# Base image
FROM node:22-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Build the Vite app
RUN npm run build

# Install serve globally
RUN npm install -g serve@latest

# Remove node_modules to reduce image size
RUN rm -rf node_modules

# Expose port
EXPOSE 3000

# Start app with SPA fallback
CMD ["serve", "-s", "dist", "-l", "3000"]
