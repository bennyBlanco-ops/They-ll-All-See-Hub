# LiveSketch: Real-Time Collaborative Drawing Platform
## Overview
LiveSketch is an open-source real-time collaborative drawing application designed for teams and creators to brainstorm and visualize ideas together seamlessly. Built with a modern full-stack architecture, it enables multiple users to draw on a shared canvas in real-time, with built-in tools for quick sketching, shape suggestions, and session management. The app leverages functional programming principles in the backend for reliable handling of concurrent user interactions and includes data analytics for monitoring usage patterns.
This project demonstrates skills in building interactive UIs, scalable backends, data processing, and containerized deployments—ideal for exploring distributed systems and real-time applications.

---
## Key Features

- **Real-Time Collaboration:** Users join sessions via WebSockets for synchronized drawing updates.
- **Intuitive UI Tools:** One-click access to brushes, shapes, and erasers with customizable options.
- **Intelligent Insights:** Backend analytics detect unusual activity (e.g., spam drawing) and suggest optimizations.
- **Seamless Integrations:** API hooks for external tool libraries (simulated).
- **Robust Infrastructure:** Dockerized services for easy local development and scaling.
- **Data Visualization:** Simple dashboards for viewing collaboration metrics.

---
## Tech Stack

- **Frontend:** React.js with Fabric.js for canvas rendering.
- **Backend:** Elixir with Phoenix for functional, concurrent logic.
- **Data Science:** Python with Pandas for anomaly detection and stats.
- **Infrastructure:** Docker Compose for multi-container setup.
- **Real-Time:** Phoenix Channels for live updates.

---
## Quick Start

### Prerequisites:

- Node.js (v18+)
- Elixir (v1.14+)
- Python (3.10+)
- Docker & Docker Compose


### Clone & Setup:

     git clone <[your-repo-url](https://github.com/AmSh4/LiveSketch)>
     cd livesketch

### Backend Setup:
     cd server
     mix deps.get
     mix ecto.create  # If using DB, but here in-memory for simplicity
     mix phx.server

### Frontend Setup:

     cd client
     npm install
     npm start

### Data Analytics:
- Run the analysis script:
  
      cd ds
      pip install -r requirements.txt
      python analyze_logs.py

### Docker Deployment:
      docker-compose up --build
Access at `http://localhost:4000`.

---
## Architecture

- **Client:** React app handles UI rendering and sends canvas events via WebSockets.
- **Server:** Elixir Phoenix manages channels, processes updates functionally (immutable state, pattern matching).
- **Analytics:** Python script processes log data for insights like session duration and anomaly scores.
- **Infra:** Containers for isolation; simulate multi-DC with env vars.

---
## Folder Structure

---
## Contributing
Fork the repo, create a branch, and submit a PR. Focus on adding new tools or improving analytics.

---
## License
MIT License.
