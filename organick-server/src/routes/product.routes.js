import { Router } from 'express';
import { getAllProducts, getProductById, getReviews } from '../controllers/product.controller.js';

const router = Router();
router.get('/', getAllProducts);
router.get('/reviews', getReviews);
router.get('/:id', getProductById);

export default router;
