import { useState } from 'react';
import styles from './newsletter.module.css';

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
    <section className={styles.section}>
      <div className="container">
        <div className={styles.wrapper}>
          <div className={styles.overlay}></div>
          <h2 className={styles.title}>Subscribe to our Newsletter</h2>
          <form onSubmit={handleSubmit} className={styles.form}>
            <input type="email" placeholder="Your Email Address" value={email} onChange={e => setEmail(e.target.value)} required className={styles.input} />
            <button type="submit" className={styles.btn}>{sent ? 'Sent!' : 'Subscribe'}</button>
          </form>
        </div>
      </div>
    </section>
  );
}
