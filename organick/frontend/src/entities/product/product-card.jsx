import { Link } from 'react-router-dom';
import { useCartStore } from '@/shared/lib/useCartStore';
import { Rating } from '@/shared/ui/rating/rating';
import styles from './product-card.module.css';

export function ProductCard({ product }) {
  const addToCart = useCartStore(state => state.addToCart);
  return (
    <div className={styles.card}>
      <div className={styles.tag}>{product.category}</div>
      <Link to={`/shop/${product.id}`}><img src={product.image} alt={product.title} className={styles.image} /></Link>
      <Link to={`/shop/${product.id}`}><h3 className={styles.title}>{product.title}</h3></Link>
      <div className={styles.divider} />
      <div className={styles.bottom}>
        <div>
          <span className={styles.price}>${product.price.toFixed(2)}</span>
          <span className={styles.oldPrice}>${product.oldPrice.toFixed(2)}</span>
        </div>
        <Rating value={product.rating} />
      </div>
      <button onClick={() => addToCart(product)} style={{ marginTop: '15px', background: 'var(--accent)', color: 'var(--primary)', padding: '10px', borderRadius: '10px', fontWeight: 'bold' }}>Add to Cart +</button>
    </div>
  );
}
