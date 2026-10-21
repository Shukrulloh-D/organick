#!/bin/bash
cd frontend

# ==========================================
# WIDGETS: HEADER
# ==========================================
cat > src/widgets/header/header.module.css << 'END'
.header { background: #fff; padding: 25px 0; position: sticky; top: 0; z-index: 100; }
.inner { display: flex; justify-content: space-between; align-items: center; }
.nav { display: flex; gap: 40px; font-weight: 500; color: var(--primary); font-size: 16px; }
.nav a:hover { color: var(--secondary); }
.searchWrap { display: flex; align-items: center; background: #FAFAFA; border-radius: 36px; padding: 5px 5px 5px 20px; width: 300px; }
.searchInput { border: none; background: transparent; outline: none; flex: 1; font-size: 14px; }
.searchBtn { background: var(--secondary); color: #fff; width: 45px; height: 45px; border-radius: 50%; display: flex; align-items: center; justify-content: center; }
.actions { display: flex; align-items: center; gap: 20px; }
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
            <NavLink to="/">Home</NavLink>
            <NavLink to="/about">About</NavLink>
            <NavLink to="/shop">Shop</NavLink>
            <NavLink to="/news">News</NavLink>
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
# WIDGETS: NEWSLETTER (Повторяется на всех страницах)
# ==========================================
cat > src/widgets/newsletter/newsletter.module.css << 'END'
.section { padding: 100px 0; }
.wrapper { background: url('/images/newsletter-bg.jpg') center/cover; border-radius: 30px; padding: 100px 70px; display: flex; justify-content: space-between; align-items: center; position: relative; overflow: hidden; }
/* Если нет картинки, используем цвет */
.wrapper::before { content: ''; position: absolute; inset: 0; background: rgba(39, 76, 91, 0.8); z-index: 1; }
.content { position: relative; z-index: 2; color: #fff; max-width: 400px; }
.title { color: #fff; font-size: 50px; line-height: 1.2; }
.form { position: relative; z-index: 2; display: flex; gap: 10px; }
.input { padding: 20px 30px; border-radius: 16px; border: none; width: 350px; font-size: 16px; outline: none; }
.btn { background: var(--primary); color: #fff; padding: 20px 40px; border-radius: 16px; font-weight: bold; font-size: 16px; transition: 0.3s; }
.btn:hover { background: #1a3642; }
END

cat > src/widgets/newsletter/newsletter.jsx << 'END'
import styles from './newsletter.module.css';

export function Newsletter() {
  return (
    <section className={styles.section}>
      <div className="container">
        <div className={styles.wrapper}>
          <div className={styles.content}>
            <h2 className={styles.title}>Subscribe to our Newsletter</h2>
          </div>
          <div className={styles.form}>
            <input type="email" placeholder="Your Email Address" className={styles.input} />
            <button className={styles.btn}>Subscribe</button>
          </div>
        </div>
      </div>
    </section>
  );
}
END

# ==========================================
# WIDGETS: FOOTER
# ==========================================
cat > src/widgets/footer/footer.module.css << 'END'
.footer { background: #F1F8F4; padding: 100px 0 30px; margin-top: 50px; }
.grid { display: grid; grid-template-columns: 1fr 2fr 1fr; gap: 50px; margin-bottom: 50px; }
.colTitle { font-family: var(--font-heading); font-size: 30px; color: var(--primary); margin-bottom: 30px; text-align: right; }
.textRight { text-align: right; color: var(--text); line-height: 2; }
.textLeft { text-align: left; color: var(--text); line-height: 2; }
.center { text-align: center; display: flex; flex-direction: column; align-items: center; border-left: 1px solid #D4D4D4; border-right: 1px solid #D4D4D4; padding: 0 30px; }
.socials { display: flex; gap: 15px; margin-top: 20px; }
.socialIcon { width: 40px; height: 40px; border-radius: 50%; background: var(--primary); color: #fff; display: flex; align-items: center; justify-content: center; }
.bottom { text-align: center; border-top: 1px solid #D4D4D4; padding-top: 30px; color: var(--text); }
END

cat > src/widgets/footer/footer.jsx << 'END'
import { Logo } from '@/shared/ui/logo/logo';
import styles from './footer.module.css';

export function Footer() {
  return (
    <footer className={styles.footer}>
      <div className="container">
        <div className={styles.grid}>
          <div>
            <h3 className={styles.colTitle}>Contact Us</h3>
            <div className={styles.textRight}>
              <p><strong>Email:</strong><br/>needhelp@Organick.com</p>
              <p style={{ marginTop: '20px' }}><strong>Phone:</strong><br/>666 888 888</p>
              <p style={{ marginTop: '20px' }}><strong>Address:</strong><br/>88 road, brooklyn street, USA</p>
            </div>
          </div>
          <div className={styles.center}>
            <Logo />
            <p style={{ marginTop: '20px', color: 'var(--text)' }}>Simply dummy text of the printing and typesetting industry. Lorem Ipsum simply dummy text of the printing.</p>
            <div className={styles.socials}>
              <a href="#" className={styles.socialIcon}>f</a>
              <a href="#" className={styles.socialIcon}>t</a>
              <a href="#" className={styles.socialIcon}>in</a>
            </div>
          </div>
          <div>
            <h3 className={styles.colTitle} style={{ textAlign: 'left' }}>Utility Pages</h3>
            <div className={styles.textLeft}>
              <p>Style Guide</p>
              <p style={{ marginTop: '15px' }}>404 Not Found</p>
              <p style={{ marginTop: '15px' }}>Password Protected</p>
              <p style={{ marginTop: '15px' }}>Licenses</p>
            </div>
          </div>
        </div>
        <div className={styles.bottom}>
          Copyright © <strong>Organick</strong>
        </div>
      </div>
    </footer>
  );
}
END

echo "✅ Хедер, Футер и Рассылка готовы!"
