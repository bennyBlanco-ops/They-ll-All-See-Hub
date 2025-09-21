import React, { useState, useEffect } from 'react';
import io from 'socket.io-client';
import Canvas from './components/Canvas';
import Toolbar from './components/Toolbar';
import './App.css';  // Empty CSS for styling

const socket = io();

function App() {
  const [sessionId, setSessionId] = useState('default');
  const [isConnected, setIsConnected] = useState(false);

  useEffect(() => {
    socket.on('connect', () => {
      setIsConnected(true);
      console.log('Connected to server');
    });

    socket.on('disconnect', () => {
      setIsConnected(false);
    });

    return () => socket.disconnect();
  }, []);

  const joinSession = (id) => {
    setSessionId(id);
    socket.emit('join', { session: id });
  };

  return (
    <div className="App">
      <header>
        <h1>LiveSketch Collaborative Canvas</h1>
        {isConnected ? <span>Connected</span> : <span>Disconnected</span>}
      </header>
      <Toolbar onJoin={joinSession} />
      <Canvas sessionId={sessionId} socket={socket} />
    </div>
  );
}

export default App;