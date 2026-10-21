#!/bin/bash
cd frontend

# ==========================================
# WIDGETS: HEADER (Сложный, с выпадающим меню)
# ==========================================
cat > src/widgets/header/header.module.css << 'END'
.header { background: #fff; padding: 25px 0; position: sticky; top: 0; z-index: 100; }
.inner { display: flex; justify-content: space-between; align-items: center; }
.nav { display: flex; gap: 30px; font-weight: 500; color: var(--primary); font-size: 15px; align-items: center; }
.navItem { position: relative; cursor: pointer; padding: 10px 0; }
.navItem:hover { color: var(--secondary); }
.dropdown { position: absolute; top: 100%; left: 0; background: #fff; box-shadow: 0 10px 30px rgba(0,0,0,0.1); border-radius: 10px; padding: 15px 0; min-width: 200px; display: flex; flex-direction: column; opacity: 0; visibility: hidden; transition: 0.3s; }
.navItem:hover .dropdown { opacity: 1; visibility: visible; }
.dropdown a { padding: 10px 20px; transition: 0.2s; }
.dropdown a:hover { background: #F1F8F4; color: var(--secondary); padding-left: 25px; }
.searchWrap { display: flex; align-items: center; background: #FAFAFA; border-radius: 36px; padding: 5px 5px 5px 20px; width: 280px; }
.searchInput { border: none; background: transparent; outline: none; flex: 1; font-size: 14px; }
.searchBtn { background: var(--secondary); color: #fff; width: 45px; height: 45px; border-radius: 50%; display: flex; align-items: center; justify-content: center; }
.actions { display: flex; align-items: center; gap: 15px; }
.cartBtn { display: flex; align-items: center; gap: 10px; border: 1px solid #E0E0E0; padding: 5px 20px 5px 5px; border-radius: 36px; font-weight: 600; color: var(--primary); }
.cartIcon { background: var(--primary); color: #fff; width: 45px; height: 45px; border-radius: 50%; display: flex; align-items: center; justify-content: center; }
END

cat > src/widgets/header/header.jsx << 'END'
import { Link, NavLink } from 'react-router-dom';
import { Logo } from '@/shared/ui/logo/logo';
import { useCartStore } from '@/shared/lib/useCartStore';
import styles from './header.module.css';

export function Header() {
  const { cart, toggleCart } = useCartStore();
  const totalItems = cart.reduce((sum, item) => sum + item.qty, 0);

  return (
    <header className={styles.header}>
      <div className="container">
        <div className={styles.inner}>
          <Logo />
          <nav className={styles.nav}>
            <NavLink to="/" className={styles.navItem}>Home</NavLink>
            <NavLink to="/about" className={styles.navItem}>About</NavLink>
            
            {/* Выпадающее меню Pages */}
            <div className={styles.navItem}>
              Pages ▾
              <div className={styles.dropdown}>
                <Link to="/shop">Shop</Link>
                <Link to="/shop/1">Shop Single</Link>
                <Link to="/portfolio">Portfolio</Link>
                <Link to="/team">Team</Link>
                <Link to="/blog">Blog</Link>
                <Link to="/contact">Contact</Link>
                <Link to="/404">404 Not Found</Link>
              </div>
            </div>

            <NavLink to="/shop" className={styles.navItem}>Shop</NavLink>
            <NavLink to="/portfolio" className={styles.navItem}>Projects</NavLink>
            <NavLink to="/blog" className={styles.navItem}>News</NavLink>
          </nav>
          <div className={styles.actions}>
            <div className={styles.searchWrap}>
              <input type="text" placeholder="Search..." className={styles.searchInput} />
              <button className={styles.searchBtn}>🔍</button>
            </div>
            <button className={styles.cartBtn} onClick={() => toggleCart(true)}>
              <div className={styles.cartIcon}>🛒</div>
              Cart ({totalItems})
            </button>
          </div>
        </div>
      </div>
    </header>
  );
}
END

# ==========================================
# WIDGETS: NEWSLETTER (Скрин 3)
# ==========================================
cat > src/widgets/newsletter/newsletter.jsx << 'END'
import { useState } from 'react';

export function Newsletter() {
  const [email, setEmail] = useState('');
  const [sent, setSent] = useState(false);

  const handleSubmit = (e) => {
    e.preventDefault();
    setSent(true);
    setEmail('');
    setTimeout(() => setSent(false), 3000);
  };

  return (
    <section style={{ padding: '100px 0' }}>
      <div className="container">
        <div style={{ background: 'url(https://images.unsplash.com/photo-1610832958506-aa56368176cf?q=80&w=2070&auto=format&fit=crop) center/cover', borderRadius: '30px', padding: '80px 70px', display: 'flex', justifyContent: 'space-between', alignItems: 'center', position: 'relative', overflow: 'hidden' }}>
          <div style={{ position: 'absolute', inset: 0, background: 'rgba(39, 76, 91, 0.7)' }}></div>
          <h2 style={{ position: 'relative', zIndex: 2, color: '#fff', fontSize: '45px', maxWidth: '400px', lineHeight: 1.2 }}>Subscribe to our Newsletter</h2>
          <form onSubmit={handleSubmit} style={{ position: 'relative', zIndex: 2, display: 'flex', gap: '10px' }}>
            <input type="email" placeholder="Your Email Address" value={email} onChange={e => setEmail(e.target.value)} required style={{ padding: '20px 30px', borderRadius: '16px', border: 'none', width: '350px', fontSize: '16px', outline: 'none' }} />
            <button type="submit" style={{ background: 'var(--primary)', color: '#fff', padding: '20px 40px', borderRadius: '16px', fontWeight: 'bold', fontSize: '16px' }}>{sent ? 'Sent!' : 'Subscribe'}</button>
          </form>
        </div>
      </div>
    </section>
  );
}
END

# ==========================================
# WIDGETS: FOOTER (Скрин 3)
# ==========================================
cat > src/widgets/footer/footer.jsx << 'END'
import { Logo } from '@/shared/ui/logo/logo';

export function Footer() {
  return (
    <footer style={{ background: '#F1F8F4', padding: '100px 0 30px' }}>
      <div className="container">
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 2fr 1fr', gap: '50px', marginBottom: '50px' }}>
          <div style={{ textAlign: 'right' }}>
            <h3 style={{ fontSize: '30px', color: 'var(--primary)', marginBottom: '30px', fontFamily: 'var(--font-heading)' }}>Contact Us</h3>
            <p style={{ lineHeight: 2 }}><strong>Email:</strong><br/>needhelp@Organick.com</p>
            <p style={{ marginTop: '20px', lineHeight: 2 }}><strong>Phone:</strong><br/>666 888 888</p>
            <p style={{ marginTop: '20px', lineHeight: 2 }}><strong>Address:</strong><br/>88 road, brooklyn street, USA</p>
          </div>
          <div style={{ textAlign: 'center', borderLeft: '1px solid #D4D4D4', borderRight: '1px solid #D4D4D4', padding: '0 30px' }}>
            <Logo />
            <p style={{ marginTop: '20px', color: 'var(--text)', lineHeight: 1.8 }}>Simply dummy text of the printing and typesetting industry. Lorem Ipsum simply dummy text of the printing.</p>
            <div style={{ display: 'flex', gap: '15px', marginTop: '20px', justifyContent: 'center' }}>
              <a href="#" style={{ width: '40px', height: '40px', borderRadius: '50%', background: 'var(--primary)', color: '#fff', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>f</a>
              <a href="#" style={{ width: '40px', height: '40px', borderRadius: '50%', background: 'var(--primary)', color: '#fff', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>t</a>
              <a href="#" style={{ width: '40px', height: '40px', borderRadius: '50%', background: 'var(--primary)', color: '#fff', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>in</a>
            </div>
          </div>
          <div>
            <h3 style={{ fontSize: '30px', color: 'var(--primary)', marginBottom: '30px', fontFamily: 'var(--font-heading)' }}>Utility Pages</h3>
            <p style={{ marginBottom: '15px' }}>Style Guide</p>
            <p style={{ marginBottom: '15px' }}>404 Not Found</p>
            <p style={{ marginBottom: '15px' }}>Password Protected</p>
            <p style={{ marginBottom: '15px' }}>Licenses</p>
            <p>Changelog</p>
          </div>
        </div>
        <div style={{ textAlign: 'center', borderTop: '1px solid #D4D4D4', paddingTop: '30px', color: 'var(--text)' }}>
          Copyright © <strong>Organick</strong>
        </div>
      </div>
    </footer>
  );
}
END

echo "✅ Виджеты (Хедер с меню, Футер, Рассылка) готовы!"
