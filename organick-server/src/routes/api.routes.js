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
