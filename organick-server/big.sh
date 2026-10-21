#!/bin/bash
cd organick-server

# ==========================================
# 1. ОГРОМНАЯ БАЗА ДАННЫХ
# ==========================================
cat > src/data/db.js << 'END'
export const products = [
  { id: 1, category: 'Vegetable', title: 'Calabrese Broccoli', price: 13.00, oldPrice: 20.00, rating: 4, image: '/images/broccoli.png', description: 'Simply dummy text of the printing and typesetting industry.' },
  { id: 2, category: 'Fresh', title: 'Fresh Banana Fruites', price: 14.00, oldPrice: 20.00, rating: 5, image: '/images/banana.png', description: 'Simply dummy text of the printing and typesetting industry.' },
  { id: 3, category: 'Millets', title: 'White Nuts', price: 15.00, oldPrice: 20.00, rating: 4, image: '/images/nuts.png', description: 'Simply dummy text of the printing and typesetting industry.' },
  { id: 4, category: 'Vegetable', title: 'Vegan Red Tomato', price: 17.00, oldPrice: 20.00, rating: 5, image: '/images/tomato.png', description: 'Simply dummy text of the printing and typesetting industry.' },
  { id: 5, category: 'Health', title: 'Mung Bean', price: 11.00, oldPrice: 20.00, rating: 4, image: '/images/bean.png', description: 'Simply dummy text of the printing and typesetting industry.' },
  { id: 6, category: 'Nuts', title: 'Brown Hazelnut', price: 12.00, oldPrice: 20.00, rating: 4, image: '/images/hazelnut.png', description: 'Simply dummy text of the printing and typesetting industry.' },
  { id: 7, category: 'Fresh', title: 'Eggs', price: 17.00, oldPrice: 20.00, rating: 4, image: '/images/eggs.png', description: 'Simply dummy text of the printing and typesetting industry.' },
  { id: 8, category: 'Fresh', title: 'Zelco Suji Elaichi Rusk', price: 15.00, oldPrice: 20.00, rating: 5, image: '/images/rusk.png', description: 'Simply dummy text of the printing and typesetting industry.' }
];

export const portfolio = [
  { id: 1, title: 'Green & Tasty Lemon', category: 'Fruit', image: '/images/portfolio-1.jpg' },
  { id: 2, title: 'Organic Carrot', category: 'Vegetable', image: '/images/portfolio-2.jpg' },
  { id: 3, title: 'Organic Betel Leaf', category: 'Leaf', image: '/images/portfolio-3.jpg' },
  { id: 4, title: 'Natural Tomato', category: 'Fruit', image: '/images/portfolio-4.jpg' },
  { id: 5, title: 'Black Raspberry', category: 'Fruit', image: '/images/portfolio-5.jpg' },
  { id: 6, title: 'Honey Orange', category: 'Fruit', image: '/images/portfolio-6.jpg' }
];

export const team = [
  { id: 1, name: 'Giovani Bacardo', role: 'Farmer', image: '/images/team-1.jpg' },
  { id: 2, name: 'Marianne Loreno', role: 'Designer', image: '/images/team-2.jpg' },
  { id: 3, name: 'Riga Pelore', role: 'Farmer', image: '/images/team-3.jpg' },
  { id: 4, name: 'Keira Knightley', role: 'Designer', image: '/images/team-4.jpg' },
  { id: 5, name: 'Scott Lawrence', role: 'Farmer', image: '/images/team-5.jpg' },
  { id: 6, name: 'Karen Allen', role: 'Designer', image: '/images/team-6.jpg' }
];

export const posts = [
  { id: 1, title: 'The Benefits of Vitamin D & How to Get It', date: '25 Nov', author: 'Rachi Card', image: '/images/blog-1.jpg', text: 'Simply dummy text of the printing and typesetting industry. Lorem Ipsum' },
  { id: 2, title: 'Our Favourite Summertime Tomato', date: '25 Nov', author: 'Rachi Card', image: '/images/blog-2.jpg', text: 'Simply dummy text of the printing and typesetting industry. Lorem Ipsum' },
  { id: 3, title: 'Benefits of Vitamin C & How to Get It', date: '25 Nov', author: 'Rachi Card', image: '/images/blog-3.jpg', text: 'Simply dummy text of the printing and typesetting industry. Lorem Ipsum' },
  { id: 4, title: 'Research More Organic Foods', date: '25 Nov', author: 'Rachi Card', image: '/images/blog-4.jpg', text: 'Simply dummy text of the printing and typesetting industry. Lorem Ipsum' },
  { id: 5, title: 'Everyday Fresh Fruites', date: '25 Nov', author: 'Rachi Card', image: '/images/blog-5.jpg', text: 'Simply dummy text of the printing and typesetting industry. Lorem Ipsum' },
  { id: 6, title: "Don't Use Plastic Product! It's Kill Nature", date: '25 Nov', author: 'Rachi Card', image: '/images/blog-6.jpg', text: 'Simply dummy text of the printing and typesetting industry. Lorem Ipsum' }
];

export const reviews = [
  { id: 1, name: 'Sara Taylor', role: 'Consumer', text: 'Simply dummy text of the printing and typesetting industry. Lorem Ipsum simply dummy text of the printing and typesetting industry. Lorem Ipsum has been.', avatar: '/images/user.png', stars: 5 }
];
END

# ==========================================
# 2. КОНТРОЛЛЕРЫ И РОУТЫ
# ==========================================
cat > src/controllers/data.controller.js << 'END'
import { products, portfolio, team, posts, reviews } from '../data/db.js';

export const getProducts = (req, res) => res.json(products);
export const getProductById = (req, res) => {
  const item = products.find(p => p.id === Number(req.params.id));
  item ? res.json(item) : res.status(404).json({ message: 'Not found' });
};

export const getPortfolio = (req, res) => res.json(portfolio);
export const getTeam = (req, res) => res.json(team);
export const getPosts = (req, res) => res.json(posts);
export const getPostById = (req, res) => {
  const item = posts.find(p => p.id === Number(req.params.id));
  item ? res.json(item) : res.status(404).json({ message: 'Not found' });
};
export const getReviews = (req, res) => res.json(reviews);
END

cat > src/routes/api.routes.js << 'END'
import { Router } from 'express';
import * as ctrl from '../controllers/data.controller.js';

const router = Router();

router.get('/products', ctrl.getProducts);
router.get('/products/:id', ctrl.getProductById);
router.get('/portfolio', ctrl.getPortfolio);
router.get('/team', ctrl.getTeam);
router.get('/posts', ctrl.getPosts);
router.get('/posts/:id', ctrl.getPostById);
router.get('/reviews', ctrl.getReviews);

export default router;
END

# Обновляем app.js
cat > src/app.js << 'END'
import express from 'express';
import cors from 'cors';
import apiRoutes from './routes/api.routes.js';

const app = express();
app.use(cors());
app.use(express.json());
app.use('/api', apiRoutes);
app.use((req, res) => res.status(404).json({ message: 'API Not Found' }));

export default app;
END

echo "✅ Бэкенд обновлен! Перезапусти сервер (Ctrl+C -> npm start)."
