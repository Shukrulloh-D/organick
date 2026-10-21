import { Link } from 'react-router-dom';
export function PostCard({ post }) {
  return (
    <div style={{ borderRadius: '30px', overflow: 'hidden', background: '#fff', boxShadow: '0 10px 30px rgba(0,0,0,0.05)', position: 'relative' }}>
      <div style={{ position: 'relative' }}>
        <img src={post.image} alt={post.title} style={{ width: '100%', height: '250px', objectFit: 'cover' }} />
        <div style={{ position: 'absolute', top: '20px', left: '20px', background: 'var(--primary)', color: '#fff', width: '60px', height: '60px', borderRadius: '50%', display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', fontWeight: 'bold', fontSize: '14px' }}>
           <span>{post.date.split(' ')[0]}</span>
           <span>{post.date.split(' ')[1]}</span>
        </div>
      </div>
      <div style={{ padding: '30px', background: '#fff', margin: '-30px 20px 20px', borderRadius: '30px', position: 'relative', boxShadow: '0 10px 20px rgba(0,0,0,0.05)' }}>
        <p style={{ fontSize: '14px', color: 'var(--text)', marginBottom: '10px' }}>✍️ By {post.author}</p>
        <h3 style={{ fontSize: '20px', color: 'var(--primary)', marginBottom: '15px', fontFamily: 'var(--font-heading)' }}>{post.title}</h3>
        <p style={{ fontSize: '14px', color: '#777', marginBottom: '20px' }}>{post.text}</p>
        <Link to={`/blog/${post.id}`} style={{ background: 'var(--accent)', color: 'var(--primary)', padding: '12px 25px', borderRadius: '10px', fontWeight: 'bold', display: 'inline-block' }}>Read More ↗</Link>
      </div>
    </div>
  );
}
