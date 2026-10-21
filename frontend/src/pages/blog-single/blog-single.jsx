import { useParams } from 'react-router-dom';
import { usePost } from '@/shared/api/queries';

export function BlogSinglePage() {
  const { id } = useParams();
  const { data: post } = usePost(id);
  if (!post) return <div className="container" style={{ padding: '100px 0' }}>Loading...</div>;

  return (
    <>
      <div style={{ height: '400px', background: `url(${post.image}) center/cover`, position: 'relative' }}>
        <div style={{ position: 'absolute', inset: 0, background: 'rgba(0,0,0,0.4)' }}></div>
      </div>
      <section style={{ padding: '100px 0' }}>
        <div className="container" style={{ maxWidth: '800px' }}>
          <div style={{ background: '#fff', padding: '50px', borderRadius: '30px', marginTop: '-150px', position: 'relative', boxShadow: '0 20px 40px rgba(0,0,0,0.1)' }}>
            <p style={{ color: 'var(--text)', marginBottom: '15px' }}>✍️ By {post.author} | {post.date}</p>
            <h1 style={{ fontSize: '40px', marginBottom: '30px' }}>{post.title}</h1>
            <img src={post.image} alt={post.title} style={{ width: '100%', borderRadius: '20px', marginBottom: '30px' }} />
            <p style={{ lineHeight: 1.8, fontSize: '16px', marginBottom: '20px' }}>{post.text} Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
            <h3 style={{ fontSize: '28px', margin: '30px 0 15px' }}>Preferred Form of Vitamin D?</h3>
            <p style={{ lineHeight: 1.8, fontSize: '16px', marginBottom: '20px' }}>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            <blockquote style={{ background: '#F1F8F4', padding: '30px', borderRadius: '20px', fontSize: '18px', fontStyle: 'italic', borderLeft: '5px solid var(--secondary)', margin: '30px 0' }}>
              "The first rule of any organic used in a business is that nature applied to an efficient operation will magnify the efficiency."
            </blockquote>
          </div>
        </div>
      </section>
    </>
  );
}
