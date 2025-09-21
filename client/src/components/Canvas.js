import React, { useEffect, useRef } from 'react';
import { fabric } from 'fabric';

const Canvas = ({ sessionId, socket }) => {
  const canvasRef = useRef(null);
  const fabricCanvasRef = useRef(null);

  useEffect(() => {
    if (canvasRef.current && !fabricCanvasRef.current) {
      fabricCanvasRef.current = new fabric.Canvas(canvasRef.current, {
        width: 800,
        height: 600,
        backgroundColor: 'white',
      });

      // Listen for drawing events
      fabricCanvasRef.current.on('path:created', (opt) => {
        const pathData = opt.path.toJSON();
        socket.emit('draw', { session: sessionId, data: pathData });
      });

      // Receive updates from server
      socket.on('update', (data) => {
        if (data.session === sessionId) {
          fabric.util.enlivenObjects([data.obj], (objects) => {
            objects.forEach(obj => fabricCanvasRef.current.add(obj));
          });
        }
      });
    }

    return () => {
      if (fabricCanvasRef.current) {
        fabricCanvasRef.current.dispose();
      }
    };
  }, [sessionId, socket]);

  return <canvas ref={canvasRef} />;
};

export default Canvas;