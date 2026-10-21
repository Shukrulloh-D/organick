#!/bin/bash
cd frontend

# ==========================================
# 1. HOME PAGE (Главная)
# ==========================================
mkdir -p src/pages/home
cat > src/pages/home/home.jsx << 'END'
import { Link } from 'react-router-dom';
import { useProducts, useReviews } from '@/shared/api/queries';
import { ProductCard } from '@/entities/product/product-card';
import { SectionTitle } from '@/shared/ui/section-title/section-title';

export function HomePage() {
  const { data: products } = useProducts();
  const { data: reviews } = useReviews();

  return (
    <>
      {/* HERO */}
      <section style={{ background: '#F1F8F4', padding: '100px 0' }}>
        <div className="container" style={{ display: 'flex', alignItems: 'center', gap: '50px' }}>
          <div style={{ flex: 1 }}>
            <span style={{ fontFamily: 'var(--font-script)', color: 'var(--secondary)', fontSize: '36px' }}>100% Natural Food</span>
            <h1 style={{ fontSize: '70px', lineHeight: 1.1, marginBottom: '30px', marginTop: '10px' }}>Choose the best healthier way of life</h1>
            <Link to="/shop" className="btn-accent">Explore Now ↗</Link>
          </div>
          <div style={{ flex: 1, textAlign: 'right' }}>
            <img src="/images/hero-food.png" alt="Healthy" style={{ maxHeight: '500px', marginLeft: 'auto' }} />
          </div>
        </div>
      </section>

      {/* ABOUT */}
      <section style={{ padding: '120px 0' }}>
        <div className="container" style={{ display: 'flex', alignItems: 'center', gap: '80px' }}>
          <div style={{ flex: 1 }}><img src="/images/about-fruits.png" alt="About" style={{ width: '100%' }} /></div>
          <div style={{ flex: 1 }}>
            <span style={{ fontFamily: 'var(--font-script)', color: 'var(--secondary)', fontSize: '36px' }}>About Us</span>
            <h2 style={{ fontSize: '45px', lineHeight: 1.2, marginBottom: '30px', marginTop: '10px' }}>We Believe in Working Accredited Farmers</h2>
            <p style={{ marginBottom: '30px', lineHeight: 1.8 }}>Simply dummy text of the printing and typesetting industry. Lorem had ceased to been the industry's standard dummy text ever since the 1500s.</p>
            <Link to="/about" className="btn-primary">Shop Now ↗</Link>
          </div>
        </div>
      </section>

      {/* PRODUCTS */}
      <section style={{ background: '#F9F8F8', padding: '120px 0' }}>
        <div className="container">
          <SectionTitle script="Categories" title="Our Products" />
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: '20px' }}>
            {products?.slice(0, 8).map(product => <ProductCard key={product.id} product={product} />)}
          </div>
          <div style={{ textAlign: 'center', marginTop: '50px' }}>
            <Link to="/shop" className="btn-primary">Load More ↗</Link>
          </div>
        </div>
      </section>

      {/* TESTIMONIAL */}
      <section style={{ padding: '120px 0', textAlign: 'center', background: '#F1F8F4' }}>
        <div className="container">
          <SectionTitle script="Testimonial" title="What Our Customer Saying?" />
          {reviews?.map(rev => (
            <div key={rev.id}>
              <img src={rev.avatar} alt={rev.name} style={{ width: '100px', height: '100px', borderRadius: '50%', margin: '0 auto 20px' }} />
              <div style={{ color: '#FFA858', fontSize: '24px', marginBottom: '20px' }}>{'★'.repeat(rev.stars)}</div>
              <p style={{ maxWidth: '800px', margin: '0 auto 30px', fontSize: '18px', lineHeight: 1.8 }}>{rev.text}</p>
              <h4 style={{ fontSize: '22px' }}>{rev.name}</h4>
              <p>{rev.role}</p>
            </div>
          ))}
        </div>
      </section>
    </>
  );
}
END

# ==========================================
# 2. SHOP PAGE (Магазин)
# ==========================================
mkdir -p src/pages/shop
cat > src/pages/shop/shop.jsx << 'END'
import { useProducts } from '@/shared/api/queries';
import { ProductCard } from '@/entities/product/product-card';

export function ShopPage() {
  const { data: products, isLoading } = useProducts();

  return (
    <>
      <div style={{ background: '#F1F8F4', padding: '80px 0', textAlign: 'center' }}>
        <h1 style={{ fontSize: '50px' }}>Shop</h1>
      </div>
      <section style={{ padding: '120px 0' }}>
        <div className="container">
          {isLoading ? <p>Loading...</p> : (
            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: '20px' }}>
              {products?.map(product => <ProductCard key={product.id} product={product} />)}
            </div>
          )}
        </div>
      </section>
    </>
  );
}
END

# ==========================================
# 3. SHOP SINGLE (Страница товара)
# ==========================================
mkdir -p src/pages/shop-single
cat > src/pages/shop-single/shop-single.jsx << 'END'
import { useParams, Link } from 'react-router-dom';
import { useProduct, useProducts } from '@/shared/api/queries';
import { useCartStore } from '@/shared/lib/useCartStore';
import { ProductCard } from '@/entities/product/product-card';
import { useState } from 'react';

export function ShopSinglePage() {
  const { id } = useParams();
  const { data: product, isLoading } = useProduct(id);
  const { data: related } = useProducts();
  const addToCart = useCartStore(state => state.addToCart);
  const [qty, setQty] = useState(1);

  if (isLoading) return <div className="container" style={{ padding: '100px 0' }}>Loading...</div>;
  if (!product) return <div className="container" style={{ padding: '100px 0' }}>Product not found</div>;

  return (
    <>
      <div style={{ background: '#F1F8F4', padding: '80px 0', textAlign: 'center' }}>
        <h1 style={{ fontSize: '50px' }}>Shop Single</h1>
      </div>
      
      <section style={{ padding: '100px 0' }}>
        <div className="container" style={{ display: 'flex', gap: '50px' }}>
          <div style={{ flex: 1, background: '#F9F8F8', borderRadius: '30px', padding: '50px' }}>
            <img src={product.image} alt={product.title} style={{ width: '100%', objectFit: 'contain' }} />
          </div>
          <div style={{ flex: 1, paddingTop: '20px' }}>
            <h2 style={{ fontSize: '40px', marginBottom: '20px' }}>{product.title}</h2>
            <div style={{ display: 'flex', gap: '15px', alignItems: 'center', marginBottom: '30px' }}>
              <span style={{ fontSize: '24px', fontWeight: 'bold', color: 'var(--primary)' }}>${product.price.toFixed(2)}</span>
              <span style={{ textDecoration: 'line-through', color: '#B8B8B8' }}>${product.oldPrice?.toFixed(2)}</span>
              <span style={{ color: '#FFA858', fontSize: '20px' }}>{'★'.repeat(product.rating)}</span>
            </div>
            <p style={{ lineHeight: 1.8, color: 'var(--text)', marginBottom: '40px' }}>
              {product.description} Simply dummy text of the printing and typesetting industry. Lorem had ceased to been the industry's standard dummy text ever since the 1500s.
            </p>
            <div style={{ display: 'flex', gap: '20px', alignItems: 'center' }}>
              <div style={{ display: 'flex', alignItems: 'center', border: '1px solid #ccc', borderRadius: '10px', padding: '10px 20px', gap: '20px' }}>
                <button onClick={() => setQty(q => Math.max(1, q - 1))} style={{ fontSize: '20px' }}>-</button>
                <span style={{ fontSize: '18px', fontWeight: 'bold' }}>{qty}</span>
                <button onClick={() => setQty(q => q + 1)} style={{ fontSize: '20px' }}>+</button>
              </div>
              <button className="btn-primary" onClick={() => addToCart({ ...product, qty })}>Add To Cart ↗</button>
            </div>
          </div>
        </div>
      </section>

      <section style={{ padding: '50px 0 100px' }}>
        <div className="container">
          <h2 style={{ textAlign: 'center', fontSize: '40px', marginBottom: '50px' }}>Related Products</h2>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: '20px' }}>
            {related?.filter(p => p.id !== product.id).slice(0, 4).map(p => <ProductCard key={p.id} product={p} />)}
          </div>
        </div>
      </section>
    </>
  );
}
END

# ==========================================
# 4. ABOUT PAGE (О нас)
# ==========================================
mkdir -p src/pages/about
cat > src/pages/about/about.jsx << 'END'
import { useTeam } from '@/shared/api/queries';
import { TeamCard } from '@/entities/team/team-card';
import { SectionTitle } from '@/shared/ui/section-title/section-title';

export function AboutPage() {
  const { data: team } = useTeam();
  return (
    <>
      <div style={{ background: '#F1F8F4', padding: '80px 0', textAlign: 'center' }}>
        <h1 style={{ fontSize: '50px' }}>About Us</h1>
      </div>
      <section style={{ padding: '120px 0' }}>
        <div className="container" style={{ display: 'flex', alignItems: 'center', gap: '80px' }}>
          <div style={{ flex: 1 }}>
            <span style={{ fontFamily: 'var(--font-script)', color: 'var(--secondary)', fontSize: '36px' }}>About Us</span>
            <h2 style={{ fontSize: '45px', lineHeight: 1.2, marginBottom: '30px', marginTop: '10px' }}>We do Creative Things for Success</h2>
            <p style={{ marginBottom: '30px', lineHeight: 1.8 }}>Simply dummy text of the printing and typesetting industry. Lorem had ceased to been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley.</p>
            <div style={{ display: 'flex', gap: '40px', marginTop: '40px' }}>
              <div>
                <h4 style={{ fontSize: '20px', marginBottom: '10px' }}>Modern Agriculture Equipment</h4>
              </div>
              <div>
                <h4 style={{ fontSize: '20px', marginBottom: '10px' }}>No growth hormones are used</h4>
              </div>
            </div>
          </div>
          <div style={{ flex: 1 }}><img src="/images/about-bowl.png" alt="About" style={{ width: '100%' }} /></div>
        </div>
      </section>

      <section style={{ padding: '100px 0', background: '#F9F8F8' }}>
        <div className="container">
          <SectionTitle script="Team" title="Our Organic Experts" />
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: '30px' }}>
            {team?.slice(0, 3).map(member => <TeamCard key={member.id} member={member} />)}
          </div>
        </div>
      </section>
    </>
  );
}
END

# ==========================================
# 5. PORTFOLIO PAGE (Портфолио)
# ==========================================
mkdir -p src/pages/portfolio
cat > src/pages/portfolio/portfolio.jsx << 'END'
import { usePortfolio } from '@/shared/api/queries';
import { PortfolioCard } from '@/entities/portfolio/portfolio-card';

export function PortfolioPage() {
  const { data: portfolio } = usePortfolio();
  return (
    <>
      <div style={{ background: '#F1F8F4', padding: '80px 0', textAlign: 'center' }}>
        <h1 style={{ fontSize: '50px' }}>Portfolio Standard</h1>
      </div>
      <section style={{ padding: '100px 0' }}>
        <div className="container" style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: '30px' }}>
          {portfolio?.map(item => <PortfolioCard key={item.id} item={item} />)}
        </div>
      </section>
    </>
  );
}
END

# ==========================================
# 6. BLOG PAGE (Блог)
# ==========================================
mkdir -p src/pages/blog src/pages/blog-single
cat > src/pages/blog/blog.jsx << 'END'
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
END

# ==========================================
# 7. BLOG SINGLE (Статья)
# ==========================================
cat > src/pages/blog-single/blog-single.jsx << 'END'
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
END

# ==========================================
# 8. CONTACT PAGE (Контакты)
# ==========================================
mkdir -p src/pages/contact
cat > src/pages/contact/contact.jsx << 'END'
export function ContactPage() {
  return (
    <>
      <div style={{ background: '#F1F8F4', padding: '80px 0', textAlign: 'center' }}>
        <h1 style={{ fontSize: '50px' }}>Contact Us</h1>
      </div>
      <section style={{ padding: '100px 0' }}>
        <div className="container" style={{ display: 'flex', gap: '50px' }}>
          <div style={{ flex: 1 }}>
            <h2 style={{ fontSize: '40px', marginBottom: '20px' }}>We'd love to talk about how we can work together.</h2>
            <p style={{ color: 'var(--text)', marginBottom: '40px' }}>Simply dummy text of the printing and typesetting industry. Lorem had ceased to been the industry's standard dummy text ever since the 1500s.</p>
            <div style={{ display: 'flex', flexDirection: 'column', gap: '20px' }}>
              <div style={{ background: '#F9F8F8', padding: '20px', borderRadius: '16px' }}>📧 <strong>Message:</strong> needhelp@Organick.com</div>
              <div style={{ background: '#F9F8F8', padding: '20px', borderRadius: '16px' }}>📞 <strong>Contact:</strong> +1 (78) 673 3567</div>
            </div>
          </div>
          <div style={{ flex: 1, background: '#F1F8F4', padding: '50px', borderRadius: '30px' }}>
            <form style={{ display: 'flex', flexDirection: 'column', gap: '20px' }}>
              <input type="text" placeholder="Full Name" style={{ padding: '15px', borderRadius: '10px', border: '1px solid #ddd' }} />
              <input type="email" placeholder="Your Email" style={{ padding: '15px', borderRadius: '10px', border: '1px solid #ddd' }} />
              <textarea placeholder="Write Message..." rows="5" style={{ padding: '15px', borderRadius: '10px', border: '1px solid #ddd', resize: 'none' }}></textarea>
              <button type="button" className="btn-primary">Send Message ↗</button>
            </form>
          </div>
        </div>
      </section>
    </>
  );
}
END

# ==========================================
# 9. NOT FOUND (404)
# ==========================================
mkdir -p src/pages/not-found
cat > src/pages/not-found/not-found.jsx << 'END'
import { Link } from 'react-router-dom';

export function NotFoundPage() {
  return (
    <div style={{ padding: '150px 0', textAlign: 'center', background: '#F1F8F4', minHeight: '60vh' }}>
      <div className="container">
        <h1 style={{ fontSize: '200px', lineHeight: 1, color: 'var(--primary)' }}>404</h1>
        <h2 style={{ fontSize: '40px', marginBottom: '20px' }}>Page not found</h2>
        <p style={{ marginBottom: '40px' }}>The page you are looking for doesn't exist or has been moved.</p>
        <Link to="/" className="btn-primary">Go to Homepage</Link>
      </div>
    </div>
  );
}
END

echo "✅ ВСЕ 9 СТРАНИЦ СОЗДАНЫ!"
