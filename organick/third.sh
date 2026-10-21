#!/bin/bash
cd frontend

# ==========================================
# SHARED UI
# ==========================================
cat > src/shared/ui/button/button.jsx << 'END'
export function Button({ children, variant = 'primary', className = '', ...props }) {
  return (
    <button className={`btn-${variant} ${className}`} {...props}>
      {children}
    </button>
  );
}
END

cat > src/shared/ui/logo/logo.jsx << 'END'
import { Link } from 'react-router-dom';
export function Logo() {
  return (
    <Link to="/" style={{ display: 'flex', alignItems: 'center', gap: '8px', fontSize: '32px', fontWeight: 800, color: 'var(--primary)', fontFamily: 'var(--font-heading)' }}>
      <span style={{ fontSize: '40px' }}>🌿</span> Organick
    </Link>
  );
}
END

# ==========================================
# ENTITIES: PRODUCT CARD
# ==========================================
cat > src/entities/product/product-card.module.css << 'END'
.card { background: #fff; border-radius: 30px; padding: 30px; transition: transform 0.3s, box-shadow 0.3s; position: relative; display: flex; flex-direction: column; height: 100%; }
.card:hover { transform: translateY(-5px); box-shadow: 0 10px 30px rgba(0,0,0,0.05); }
.tag { background: var(--primary); color: #fff; padding: 5px 15px; border-radius: 8px; font-size: 12px; font-weight: 600; position: absolute; top: 20px; left: 20px; }
.image { width: 100%; height: 250px; object-fit: contain; margin-bottom: 20px; }
.title { font-size: 20px; font-family: var(--font-heading); color: var(--primary); margin-bottom: 15px; }
.divider { height: 1px; background: #D4D4D4; margin-bottom: 15px; }
.bottom { display: flex; justify-content: space-between; align-items: center; margin-top: auto; }
.priceWrap { display: flex; align-items: center; gap: 10px; }
.price { font-weight: 700; color: var(--primary); font-size: 18px; }
.oldPrice { text-decoration: line-through; color: #B8B8B8; font-size: 15px; }
.rating { color: #FFA858; font-size: 18px; }
END

cat > src/entities/product/product-card.jsx << 'END'
import { Link } from 'react-router-dom';
import { useCartStore } from '@/shared/lib/useCartStore';
import styles from './product-card.module.css';

export function ProductCard({ product }) {
  const addToCart = useCartStore(state => state.addToCart);

  return (
    <div className={styles.card}>
      <div className={styles.tag}>{product.category}</div>
      <Link to={`/shop/${product.id}`}>
        <img src={product.image} alt={product.title} className={styles.image} />
      </Link>
      <Link to={`/shop/${product.id}`}><h3 className={styles.title}>{product.title}</h3></Link>
      <div className={styles.divider} />
      <div className={styles.bottom}>
        <div className={styles.priceWrap}>
          <span className={styles.price}>${product.price.toFixed(2)}</span>
          {product.oldPrice && <span className={styles.oldPrice}>${product.oldPrice.toFixed(2)}</span>}
        </div>
        <div className={styles.rating}>
          {'★'.repeat(product.rating)}{'☆'.repeat(5 - product.rating)}
        </div>
      </div>
      {/* Кнопка добавления, невидимая поверх карточки при ховере */}
      <button onClick={() => addToCart(product)} style={{ marginTop: '15px', background: 'var(--accent)', color: 'var(--primary)', padding: '10px', borderRadius: '10px', fontWeight: 'bold' }}>
        Add to Cart +
      </button>
    </div>
  );
}
END

# ==========================================
# FEATURES: CART DRAWER (Выезжающая корзина)
# ==========================================
cat > src/features/cart-drawer/cart-drawer.jsx << 'END'
import { useCartStore } from '@/shared/lib/useCartStore';
import { Button } from '@/shared/ui/button/button';

export function CartDrawer() {
  const { cart, isOpen, toggleCart, removeFromCart } = useCartStore();
  const total = cart.reduce((sum, item) => sum + item.price * item.qty, 0);

  if (!isOpen) return null;

  return (
    <div style={{ position: 'fixed', inset: 0, background: 'rgba(0,0,0,0.5)', zIndex: 9999, display: 'flex', justifyContent: 'flex-end' }} onClick={() => toggleCart(false)}>
      <div style={{ width: '400px', background: '#fff', height: '100%', padding: '30px', display: 'flex', flexDirection: 'column' }} onClick={e => e.stopPropagation()}>
        <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: '30px' }}>
          <h2 style={{ fontSize: '24px' }}>Your Cart</h2>
          <button onClick={() => toggleCart(false)} style={{ fontSize: '24px' }}>✕</button>
        </div>
        
        <div style={{ flex: 1, overflowY: 'auto' }}>
          {cart.length === 0 ? <p>Cart is empty</p> : cart.map(item => (
            <div key={item.id} style={{ display: 'flex', gap: '15px', marginBottom: '20px', borderBottom: '1px solid #eee', paddingBottom: '15px' }}>
              <img src={item.image} style={{ width: '60px', height: '60px', objectFit: 'contain' }} />
              <div style={{ flex: 1 }}>
                <h4 style={{ fontSize: '14px' }}>{item.title}</h4>
                <p style={{ fontSize: '12px', color: '#777' }}>{item.qty} x ${item.price}</p>
              </div>
              <button onClick={() => removeFromCart(item.id)} style={{ color: 'red' }}>✕</button>
            </div>
          ))}
        </div>

        <div style={{ borderTop: '1px solid #eee', paddingTop: '20px' }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: '20px', fontWeight: 'bold', marginBottom: '20px' }}>
            <span>Total:</span>
            <span>${total.toFixed(2)}</span>
          </div>
          <Button variant="primary" style={{ width: '100%' }}>Checkout</Button>
        </div>
      </div>
    </div>
  );
}
END

echo "✅ UI, Карточки и Корзина готовы!"
