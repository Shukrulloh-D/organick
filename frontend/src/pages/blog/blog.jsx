import { usePosts } from '@/shared/api/queries';
import { PostCard } from '@/entities/post/post-card';

export function BlogPage() {
  const { data: posts } = usePosts();
  return (
    <>
      <div style={{ background: '#F1F8F4', padding: '80px 0', textAlign: 'center' }}>
        <h1 style={{ fontSize: '50px' }}>Recent News</h1>
      </div>
      <section style={{ padding: '100px 0' }}>
        <div className="container" style={{ display: 'grid', gridTemplateColumns: 'repeat(2, 1fr)', gap: '40px' }}>
          {posts?.map(post => <PostCard key={post.id} post={post} />)}
        </div>
      </section>
    </>
  );
}
