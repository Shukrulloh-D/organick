import { Link } from 'react-router-dom';
import styles from './post-card.module.css';
export function PostCard({ post }) {
  return (
    <div className={styles.card}>
      <div className={styles.imageWrap}>
        <img src={post.image} alt={post.title} className={styles.image} />
        <div className={styles.dateBadge}>
           <span>{post.date.split(' ')[0]}</span>
           <span>{post.date.split(' ')[1]}</span>
        </div>
      </div>
      <div className={styles.content}>
        <p className={styles.author}>✍️ By {post.author}</p>
        <h3 className={styles.title}>{post.title}</h3>
        <p className={styles.text}>{post.text}</p>
        <Link to={`/blog/${post.id}`} className={styles.btn}>Read More ↗</Link>
      </div>
    </div>
  );
}
