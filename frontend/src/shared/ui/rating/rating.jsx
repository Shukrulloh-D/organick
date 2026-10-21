import styles from './rating.module.css';
export function Rating({ value }) {
  return <div className={styles.stars}>{'★'.repeat(value)}{'☆'.repeat(5 - value)}</div>;
}
