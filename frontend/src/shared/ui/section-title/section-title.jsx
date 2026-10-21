import styles from './section-title.module.css';
export function SectionTitle({ script, title, align = 'center' }) {
  return (
    <div className={`${styles.wrapper} ${align === 'left' ? styles.wrapperLeft : ''}`}>
      {script && <span className={styles.script}>{script}</span>}
      <h2 className={styles.title}>{title}</h2>
    </div>
  );
}
