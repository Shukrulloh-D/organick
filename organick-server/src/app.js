import express from 'express';
import cors from 'cors';
import apiRoutes from './routes/api.routes.js';

const app = express();
app.use(cors());
app.use(express.json());
app.use('/api', apiRoutes);
app.use((req, res) => res.status(404).json({ message: 'API Not Found' }));

export default app;
