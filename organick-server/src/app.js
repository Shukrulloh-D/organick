import express from 'express';
import cors from 'cors';
import productRoutes from './routes/product.routes.js';

const app = express();
app.use(cors());
app.use(express.json());

// Роуты
app.use('/api/products', productRoutes);

// Обработка 404 (API)
app.use((req, res) => res.status(404).json({ message: 'API Route Not Found' }));

export default app;
