import styles from './portfolio-card.module.css';
export function PortfolioCard({ item }) {
  return (
    <div className={styles.card}>
      <img src={item.image} alt={item.title} className={styles.image} />
      <h3 className={styles.title}>{item.title}</h3>
      <p className={styles.category}>{item.category}</p>
    </div>
  );
}
