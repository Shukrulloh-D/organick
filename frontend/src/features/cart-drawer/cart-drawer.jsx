import { useCartStore } from '@/shared/lib/useCartStore';
import styles from './cart-drawer.module.css';

export function CartDrawer() {
  const { cart, isOpen, toggleCart, removeFromCart } = useCartStore();
  const total = cart.reduce((sum, item) => sum + item.price * (item.qty || 1), 0);
  
  // Логика бесплатной доставки (фишка для e-commerce)
  const freeShippingThreshold = 100;
  const progress = Math.min((total / freeShippingThreshold) * 100, 100);
  const remaining = freeShippingThreshold - total;

  if (!isOpen) return null;

  return (
    <div className={styles.overlay} onClick={() => toggleCart(false)}>
      <div className={styles.drawer} onClick={e => e.stopPropagation()}>
        <div className={styles.header}>
          <h2 className={styles.title}>Your Cart ({cart.length})</h2>
          <button onClick={() => toggleCart(false)} className={styles.closeBtn}>✕</button>
        </div>
        
        {/* Прогресс-бар доставки */}
        {cart.length > 0 && (
          <div className={styles.shippingBar}>
            <div className={styles.shippingText}>
              {remaining > 0 ? `Add $${remaining.toFixed(2)} more for FREE shipping!` : '🎉 You got FREE shipping!'}
            </div>
            <div className={styles.progressBg}>
              <div className={styles.progressFill} style={{ width: `${progress}%` }}></div>
            </div>
          </div>
        )}

        <div className={`${styles.list} no-scrollbar`}>
          {cart.length === 0 ? (
            <div className={styles.empty}>
              <div className={styles.emptyIcon}>🛒</div>
              <p>Your cart is empty.</p>
            </div>
          ) : cart.map(item => (
            <div key={item.id} className={styles.item}>
              <img src={item.image} className={styles.img} />
              <div className={styles.info}>
                <h4 className={styles.itemTitle}>{item.title}</h4>
                <p className={styles.itemPrice}>{item.qty} x ${item.price}</p>
                <button onClick={() => removeFromCart(item.id)} className={styles.removeBtn}>Remove</button>
              </div>
            </div>
          ))}
        </div>

        {cart.length > 0 && (
          <div className={styles.footer}>
            <div className={styles.totalRow}>
              <span>Total:</span>
              <span>${total.toFixed(2)}</span>
            </div>
            <button className={styles.checkoutBtn}>Proceed to Checkout ↗</button>
          </div>
        )}
      </div>
    </div>
  );
}
