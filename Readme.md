# 🎮 Video Game Hub - A React-Based Video Game Explorer

## 🌟 Purpose

Game Hub is a React-based web application that allows users to explore video games by fetching real-time data from the RAWG API. It provides users with game details, ratings, genres, and more, all in a visually appealing and interactive interface.

This project showcases modern frontend development with React, TypeScript, API integration, and containerized deployment using Docker.

---

## 🛠 Technologies Used

- **React** – For building the user interface

- **TypeScript** – Ensures type safety and better code maintainability

- **Vite** – A fast build tool for modern frontend applications

- **RAWG API** – Fetches real-time game details

- **Chakra UI** – For responsive and styled UI components

- **React Router** – Manages navigation and routing

- **Docker** – For containerized deployment

- **Nginx** – Serves the React application efficiently in production by acting as a lightweight web server

- **Node.js & npm** – For running the project locally

---

## 🚀 How to Run This Project

### **1️⃣ Running the Project with npm (Local Development)**

#### **Prerequisites:**

- Install **Node.js** (Download from: [https://nodejs.org/](https://nodejs.org/))
- Install **npm** (Comes with Node.js)

#### **Steps:**

```sh
# Clone the repository
git clone https://github.com/your-github-username/game-hub-react.git
cd game-hub-react

# Install dependencies
npm install

# Start the development server
npm run dev

```

📌 The app will be available at http://localhost:5173 in your browser.

---

2️⃣ Running the Project with Docker (Build Locally & Run)
Prerequisites:
Install Docker (Download from: https://www.docker.com/)

```sh
# Clone the repository

git clone https://github.com/your-github-username/game-hub-react.git
cd game-hub-react

# Build the Docker image

docker build -t game-hub .

# Run the Docker container

docker run -p 3000:80 game-hub

```

📌 The app will be available at http://localhost:3000 in your browser.

---

3️⃣ Running the Project from Docker Hub (Pre-Built Image Available)
The Docker image for this project has already been pushed to Docker Hub, so you can pull and run it directly without building it locally.

```sh

# Pull the Docker image from Docker Hub

docker pull prathu174/video-game-hub

# Run the Docker container

docker run -p 3000:80 prathu174/video-game-hub

```

📌 The app will be available at http://localhost:3000 in your browser.

---

📌 Notes

RAWG API Key Required – Sign up at RAWG.io to get a free API key.

Ensure that Docker is running before pulling or running the containerized version.

---

🔮 **Future Enhancements**

✅ Add a Game Details Page – Implement a dedicated page for individual game details.

✅ User Authentication – Allow users to save favorite games and create lists.
