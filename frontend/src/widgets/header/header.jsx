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
            <div className={styles.navItem}>
              Pages ▾
              <div className={styles.dropdown}>
                <Link to="/shop">Shop</Link>
                <Link to="/shop/1">Shop Single</Link>
                <Link to="/portfolio">Portfolio</Link>
                <Link to="/team">Team</Link>
                <Link to="/blog">Blog</Link>
                <Link to="/contact">Contact</Link>
                <Link to="/services">Services</Link>
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
