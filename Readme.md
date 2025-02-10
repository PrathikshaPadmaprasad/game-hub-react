# Dockerizing and Running a React App with Docker and Nginx

This document provides a detailed walkthrough of how to dockerize a React application and make it accessible to others via Docker Hub.

## **Steps to Dockerize Your React App**

### **1. Prepare the React Application**

- Ensure your React app is fully functional and ready for deployment.
- Verify that your app uses **TypeScript**, **Vite**, or other tools, and has the necessary dependencies installed.
- Add or verify a `tsconfig.json` file for TypeScript compilation.

### **2. Create a Dockerfile**

Use the following multi-stage Dockerfile to build and serve your React app with Nginx:

```dockerfile
# Stage 1: Build the React app
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Install TypeScript globally if needed
RUN npm list -g typescript || npm install -g typescript

# Copy the source code
COPY . .

# Ensure tsconfig.json exists
RUN test -f tsconfig.json || npx tsc --init

# Build the React app
RUN npm run build

# Stage 2: Use Nginx for serving the app
FROM nginx:alpine

# Set working directory in Nginx
WORKDIR /usr/share/nginx/html

# Remove default Nginx static files
RUN rm -rf ./*

# Copy the built app from the builder stage
COPY --from=builder /app/dist .

# Copy custom Nginx configuration (optional)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
```

### **3. Build the Docker Image**

Run the following command to build the Docker image:

```bash
docker build -t video-game-hub .
```

### **4. Run the Docker Container**

To run the container and map it to port 3000 on your machine:

```bash
docker run -p 3000:80 video-game-hub
```

Your application will now be accessible at `http://localhost:3000`.

### **5. Push the Image to Docker Hub**

1. **Log in to Docker Hub:**

   ```bash
   docker login
   ```

2. **Tag the Image for Docker Hub:**
   Replace `<your-username>` with your Docker Hub username:

   ```bash
   docker tag video-game-hub <your-username>/video-game-hub
   ```

3. **Push the Image to Docker Hub:**
   ```bash
   docker push <your-username>/video-game-hub
   ```

### **6. Test the Image from Docker Hub**

To test the image on another machine:

1. Pull the image from Docker Hub:
   ```bash
   docker pull <your-username>/video-game-hub
   ```
2. Run the container:
   ```bash
   docker run -p 3000:80 <your-username>/video-game-hub
   ```

The application will be accessible at `http://localhost:3000`.

---

## **README File**

### **Project Overview**

This project demonstrates a fully dockerized React application. The app is built using React and TypeScript, bundled with Vite, and served with Nginx.

### **Pull and Run the Application**

To pull and run the Dockerized application from Docker Hub:

1. Pull the Docker image:

   ```bash
   docker pull <your-username>/video-game-hub
   ```

2. Run the container:

   ```bash
   docker run -p 3000:80 <your-username>/video-game-hub
   ```

3. Open your browser and navigate to:
   ```
   http://localhost:3000
   ```

### **Dockerfile Explanation**

The multi-stage Dockerfile consists of two stages:

1. **Build Stage (Node.js):**
   - Installs dependencies.
   - Compiles TypeScript to JavaScript.
   - Builds the React app into static files.
2. **Serve Stage (Nginx):**
   - Uses Nginx to serve the built app.

### **Contact**

Feel free to reach out with questions or feedback!
