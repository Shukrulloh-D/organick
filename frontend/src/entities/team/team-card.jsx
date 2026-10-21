import styles from './team-card.module.css';
export function TeamCard({ member }) {
  return (
    <div className={styles.card}>
      <img src={member.image} alt={member.name} className={styles.image} />
      <div className={styles.info}>
        <h3 className={styles.name}>{member.name}</h3>
        <p className={styles.role}>{member.role}</p>
      </div>
    </div>
  );
}
