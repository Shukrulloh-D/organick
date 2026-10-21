import express from 'express';
import cors from 'cors';
import apiRoutes from './routes/api.routes.js';
import { logger } from './middleware/logger.js';
import { errorHandler } from './middleware/errorHandler.js';

const app = express();

// Middlewares
app.use(cors());
app.use(express.json());
app.use(logger); // <-- Логируем каждый запрос

// Routes
app.use('/api', apiRoutes);

// 404 Route (если API не найден)
app.use((req, res) => res.status(404).json({ message: 'API Route Not Found' }));

// Error Handler (всегда должен быть в самом конце)
app.use(errorHandler);

export default app;
