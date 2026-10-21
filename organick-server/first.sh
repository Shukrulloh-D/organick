#!/bin/bash
# В папке organick-server
npm init -y
npm install express cors dotenv
mkdir -p src/controllers src/routes src/data

cat > package.json << 'END'
{
  "name": "organick-server",
  "version": "1.0.0",
  "type": "module",
  "scripts": { "start": "node src/server.js" },
  "dependencies": { "express": "^4.21.0", "cors": "^2.8.5", "dotenv": "^16.3.1" }
}
END

cat > src/server.js << 'END'
import 'dotenv/config';
import app from './app.js';

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => console.log(`🚀 Server ready at http://localhost:${PORT}`));
END

cat > src/app.js << 'END'
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
END

# БАЗА ДАННЫХ (Очень большая)
cat > src/data/db.js << 'END'
export const products = [
  { id: 1, category: 'Vegetable', title: 'Calabrese Broccoli', price: 13.00, oldPrice: 20.00, rating: 4, image: '/images/broccoli.png', description: 'Simply dummy text of the printing and typesetting industry. Lorem Ipsum' },
  { id: 2, category: 'Fresh', title: 'Fresh Banana Fruites', price: 14.00, oldPrice: 20.00, rating: 5, image: '/images/banana.png', description: 'Simply dummy text of the printing and typesetting industry.' },
  { id: 3, category: 'Millets', title: 'White Nuts', price: 15.00, oldPrice: 20.00, rating: 4, image: '/images/nuts.png', description: 'Simply dummy text of the printing and typesetting industry.' },
  { id: 4, category: 'Vegetable', title: 'Vegan Red Tomato', price: 17.00, oldPrice: 20.00, rating: 5, image: '/images/tomato.png', description: 'Simply dummy text of the printing and typesetting industry.' },
  { id: 5, category: 'Health', title: 'Mung Bean', price: 11.00, oldPrice: 20.00, rating: 4, image: '/images/bean.png', description: 'Simply dummy text of the printing and typesetting industry.' },
  { id: 6, category: 'Nuts', title: 'Brown Hazelnut', price: 12.00, oldPrice: 20.00, rating: 4, image: '/images/hazelnut.png', description: 'Simply dummy text of the printing and typesetting industry.' },
  { id: 7, category: 'Fresh', title: 'Eggs', price: 17.00, oldPrice: 20.00, rating: 4, image: '/images/eggs.png', description: 'Simply dummy text of the printing and typesetting industry.' },
  { id: 8, category: 'Fresh', title: 'Zelco Suji Elaichi Rusk', price: 15.00, oldPrice: 20.00, rating: 5, image: '/images/rusk.png', description: 'Simply dummy text of the printing and typesetting industry.' }
];

export const reviews = [
  { id: 1, name: 'Sara Taylor', role: 'Consumer', text: 'Simply dummy text of the printing and typesetting industry. Lorem Ipsum simply dummy text of the printing and typesetting industry. Lorem Ipsum has been.', avatar: '/images/user.png', stars: 5 }
];
END

# КОНТРОЛЛЕРЫ (Логика)
cat > src/controllers/product.controller.js << 'END'
import { products, reviews } from '../data/db.js';

export const getAllProducts = (req, res) => {
  res.json(products);
};

export const getProductById = (req, res) => {
  const product = products.find(p => p.id === Number(req.params.id));
  if (!product) return res.status(404).json({ message: 'Product not found' });
  res.json(product);
};

export const getReviews = (req, res) => {
  res.json(reviews);
};
END

# РОУТЫ
cat > src/routes/product.routes.js << 'END'
import { Router } from 'express';
import { getAllProducts, getProductById, getReviews } from '../controllers/product.controller.js';

const router = Router();
router.get('/', getAllProducts);
router.get('/reviews', getReviews);
router.get('/:id', getProductById);

export default router;
END

echo "✅ Бэкенд готов! Запусти: npm start (из папки organick-server)"
