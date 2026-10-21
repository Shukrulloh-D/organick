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
