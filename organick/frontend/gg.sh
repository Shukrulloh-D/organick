#!/bin/bash
cd frontend

# ==========================================
# 1. SHARED UI (Кнопки, Заголовки, Инпуты)
# ==========================================
mkdir -p src/shared/ui/{button,section-title,input,rating}

cat > src/shared/ui/section-title/section-title.jsx << 'END'
export function SectionTitle({ script, title, align = 'center' }) {
  return (
    <div style={{ textAlign: align, marginBottom: '50px' }}>
      {script && <span style={{ fontFamily: 'var(--font-script)', color: 'var(--secondary)', fontSize: '36px', display: 'block', marginBottom: '10px' }}>{script}</span>}
      <h2 style={{ fontSize: '45px', fontFamily: 'var(--font-heading)', color: 'var(--primary)', fontWeight: 800 }}>{title}</h2>
    </div>
  );
}
END

cat > src/shared/ui/rating/rating.jsx << 'END'
export function Rating({ value }) {
  return <div style={{ color: '#FFA858', fontSize: '18px', letterSpacing: '2px' }}>{'★'.repeat(value)}{'☆'.repeat(5 - value)}</div>;
}
END

# ==========================================
# 2. ENTITIES (Карточки)
# ==========================================
mkdir -p src/entities/{product,team,post,portfolio}

# Product Card
cat > src/entities/product/product-card.module.css << 'END'
.card { background: #fff; border-radius: 30px; padding: 30px; transition: 0.3s; display: flex; flex-direction: column; position: relative; }
.card:hover { box-shadow: 0 20px 40px rgba(0,0,0,0.08); transform: translateY(-5px); }
.tag { background: var(--primary); color: #fff; padding: 5px 15px; border-radius: 8px; font-size: 12px; position: absolute; top: 20px; left: 20px; }
.image { width: 100%; height: 220px; object-fit: contain; margin-bottom: 20px; }
.title { font-size: 20px; font-family: var(--font-heading); color: var(--primary); margin-bottom: 15px; }
.divider { height: 1px; background: #D4D4D4; margin-bottom: 15px; }
.bottom { display: flex; justify-content: space-between; align-items: center; }
.price { font-weight: 700; color: var(--primary); font-size: 18px; }
.oldPrice { text-decoration: line-through; color: #B8B8B8; font-size: 15px; margin-left: 10px; }
END

cat > src/entities/product/product-card.jsx << 'END'
import { Link } from 'react-router-dom';
import { useCartStore } from '@/shared/lib/useCartStore';
import { Rating } from '@/shared/ui/rating/rating';
import styles from './product-card.module.css';

export function ProductCard({ product }) {
  const addToCart = useCartStore(state => state.addToCart);
  return (
    <div className={styles.card}>
      <div className={styles.tag}>{product.category}</div>
      <Link to={`/shop/${product.id}`}><img src={product.image} alt={product.title} className={styles.image} /></Link>
      <Link to={`/shop/${product.id}`}><h3 className={styles.title}>{product.title}</h3></Link>
      <div className={styles.divider} />
      <div className={styles.bottom}>
        <div>
          <span className={styles.price}>${product.price.toFixed(2)}</span>
          <span className={styles.oldPrice}>${product.oldPrice.toFixed(2)}</span>
        </div>
        <Rating value={product.rating} />
      </div>
      <button onClick={() => addToCart(product)} style={{ marginTop: '15px', background: 'var(--accent)', color: 'var(--primary)', padding: '10px', borderRadius: '10px', fontWeight: 'bold' }}>Add to Cart +</button>
    </div>
  );
}
END

# Team Card
cat > src/entities/team/team-card.jsx << 'END'
export function TeamCard({ member }) {
  return (
    <div style={{ background: '#F9F8F8', borderRadius: '30px', overflow: 'hidden', textAlign: 'center' }}>
      <img src={member.image} alt={member.name} style={{ width: '100%', height: '350px', objectFit: 'cover' }} />
      <div style={{ padding: '20px' }}>
        <h3 style={{ fontSize: '22px', color: 'var(--primary)', fontFamily: 'var(--font-heading)' }}>{member.name}</h3>
        <p style={{ color: 'var(--text)', marginBottom: '15px' }}>{member.role}</p>
      </div>
    </div>
  );
}
END

# Post Card (Blog)
cat > src/entities/post/post-card.jsx << 'END'
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
END

# Portfolio Card
cat > src/entities/portfolio/portfolio-card.jsx << 'END'
export function PortfolioCard({ item }) {
  return (
    <div style={{ textAlign: 'center' }}>
      <img src={item.image} alt={item.title} style={{ width: '100%', height: '350px', objectFit: 'cover', borderRadius: '30px', marginBottom: '20px' }} />
      <h3 style={{ fontSize: '22px', color: 'var(--primary)', fontFamily: 'var(--font-heading)' }}>{item.title}</h3>
      <p style={{ color: 'var(--text)' }}>{item.category}</p>
    </div>
  );
}
END

# ==========================================
# 3. QUERIES (React Query)
# ==========================================
cat > src/shared/api/queries.js << 'END'
import { useQuery } from '@tanstack/react-query';
import { api } from './client';

export const useProducts = () => useQuery({ queryKey: ['products'], queryFn: async () => (await api.get('/products')).data });
export const useProduct = (id) => useQuery({ queryKey: ['product', id], queryFn: async () => (await api.get(`/products/${id}`)).data, enabled: !!id });
export const usePortfolio = () => useQuery({ queryKey: ['portfolio'], queryFn: async () => (await api.get('/portfolio')).data });
export const useTeam = () => useQuery({ queryKey: ['team'], queryFn: async () => (await api.get('/team')).data });
export const usePosts = () => useQuery({ queryKey: ['posts'], queryFn: async () => (await api.get('/posts')).data });
export const usePost = (id) => useQuery({ queryKey: ['post', id], queryFn: async () => (await api.get(`/posts/${id}`)).data, enabled: !!id });
export const useReviews = () => useQuery({ queryKey: ['reviews'], queryFn: async () => (await api.get('/reviews')).data });
END

echo "✅ Shared, Entities и API готовы!"
