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
