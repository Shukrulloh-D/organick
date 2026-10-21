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
