import { Link } from 'react-router-dom';
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
            <p style={{ marginTop: '20px', color: 'var(--text)', textAlign: 'center' }}>Simply dummy text of the printing and typesetting industry. Lorem Ipsum simply dummy text of the printing.</p>
            <div className={styles.socials}>
              <a href="#" className={styles.socialIcon}>f</a>
              <a href="#" className={styles.socialIcon}>t</a>
              <a href="#" className={styles.socialIcon}>in</a>
            </div>
          </div>
          <div>
            <h3 className={styles.colTitle}>Utility Pages</h3>
            <div className={styles.textLeft}>
              <Link to="/style-guide" className={styles.utilityLink}>Style Guide</Link>
              <Link to="/404" className={styles.utilityLink}>404 Not Found</Link>
              <Link to="/password" className={styles.utilityLink}>Password Protected</Link>
              <Link to="/licenses" className={styles.utilityLink}>Licenses</Link>
              <Link to="/changelog" className={styles.utilityLink}>Changelog</Link>
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
