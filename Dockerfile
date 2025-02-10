# Use an updated Node.js version
FROM node:18-alpine AS builder

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first
COPY package*.json ./

# Install dependencies
RUN npm install

# Ensure TypeScript is installed inside the container
RUN npm list -g typescript || npm install -g typescript

# Copy the rest of the source code
COPY . .

# Ensure tsconfig.json exists (otherwise, create it)
RUN test -f tsconfig.json || npx tsc --init

# Build the React app
RUN npm run build

# Stage 2: Use Nginx for production
FROM nginx:alpine

# Set working directory inside Nginx
WORKDIR /usr/share/nginx/html

# Remove default Nginx static files
RUN rm -rf ./*

# Copy built React app from the builder stage
COPY --from=builder /app/dist .

# Copy custom Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80 for serving the app
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
