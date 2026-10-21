import { useCartStore } from '@/shared/lib/useCartStore';

export function CartDrawer() {
  const { cart, isOpen, toggleCart, removeFromCart } = useCartStore();
  const total = cart.reduce((sum, item) => sum + item.price * (item.qty || 1), 0);

  if (!isOpen) return null;

  return (
    <div style={{ position: 'fixed', inset: 0, background: 'rgba(0,0,0,0.5)', zIndex: 9999, display: 'flex', justifyContent: 'flex-end' }} onClick={() => toggleCart(false)}>
      <div style={{ width: '400px', background: '#fff', height: '100%', padding: '30px', display: 'flex', flexDirection: 'column', animation: 'slideIn 0.3s forwards' }} onClick={e => e.stopPropagation()}>
        <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: '30px' }}>
          <h2 style={{ fontSize: '24px', fontFamily: 'var(--font-heading)' }}>Your Cart</h2>
          <button onClick={() => toggleCart(false)} style={{ fontSize: '24px' }}>✕</button>
        </div>
        
        <div className="no-scrollbar" style={{ flex: 1, overflowY: "auto" }}>
          {cart.length === 0 ? <p style={{ color: '#777' }}>Your cart is empty.</p> : cart.map(item => (
            <div key={item.id} style={{ display: 'flex', gap: '15px', marginBottom: '20px', borderBottom: '1px solid #eee', paddingBottom: '15px' }}>
              <img src={item.image} style={{ width: '60px', height: '60px', objectFit: 'contain' }} />
              <div style={{ flex: 1 }}>
                <h4 style={{ fontSize: '14px', fontFamily: 'var(--font-heading)' }}>{item.title}</h4>
                <p style={{ fontSize: '12px', color: '#777' }}>{item.qty} x ${item.price}</p>
              </div>
              <button onClick={() => removeFromCart(item.id)} style={{ color: 'red' }}>✕</button>
            </div>
          ))}
        </div>

        <div style={{ borderTop: '1px solid #eee', paddingTop: '20px' }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: '20px', fontWeight: 'bold', marginBottom: '20px', fontFamily: 'var(--font-heading)' }}>
            <span>Total:</span>
            <span>${total.toFixed(2)}</span>
          </div>
          <button className="btn-primary" style={{ width: '100%' }}>Checkout</button>
        </div>
      </div>
    </div>
  );
}
