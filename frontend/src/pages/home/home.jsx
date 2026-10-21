import { Link } from 'react-router-dom';
import { useProducts, useReviews } from '@/shared/api/queries';
import { ProductCard } from '@/entities/product/product-card';
import { SectionTitle } from '@/shared/ui/section-title/section-title';
import styles from './home.module.css';

export function HomePage() {
  const { data: products } = useProducts();
  const { data: reviews } = useReviews();

  return (
    <>
      <section className={styles.hero}>
        <div className="container">
          <div className={styles.heroInner}>
            <div style={{ flex: 1 }}>
              <span className={styles.heroScript}>100% Natural Food</span>
              <h1 className={styles.heroTitle}>Choose the best healthier way of life</h1>
              <Link to="/shop" className="btn-accent">Explore Now ↗</Link>
            </div>
            <div className={styles.heroImgWrap}>
              <img src="/images/hero-food.jpg" alt="Healthy" className={styles.heroImg} />
            </div>
          </div>
        </div>
      </section>

      <section className={styles.aboutSection}>
        <div className="container">
          <div className={styles.aboutInner}>
            <div style={{ flex: 1 }}><img src="/images/about-fruits.jpg" alt="About" className={styles.aboutImg} /></div>
            <div className={styles.aboutContent}>
              <span className={styles.heroScript}>About Us</span>
              <h2 className={styles.aboutTitle}>We Believe in Working Accredited Farmers</h2>
              <p className={styles.aboutText}>Simply dummy text of the printing and typesetting industry. Lorem had ceased to been the industry's standard dummy text ever since the 1500s.</p>
              <Link to="/about" className="btn-primary">Shop Now ↗</Link>
            </div>
          </div>
        </div>
      </section>

      <section className={styles.productsSection}>
        <div className="container">
          <SectionTitle script="Categories" title="Our Products" />
          <div className={styles.productsGrid}>
            {products?.slice(0, 8).map(product => <ProductCard key={product.id} product={product} />)}
          </div>
          <div className={styles.loadMoreWrap}>
            <Link to="/shop" className="btn-primary">Load More ↗</Link>
          </div>
        </div>
      </section>

      <section className={styles.testimonialSection}>
        <div className="container">
          <SectionTitle script="Testimonial" title="What Our Customer Saying?" />
          {reviews?.map(rev => (
            <div key={rev.id}>
              <img src={rev.avatar} alt={rev.name} className={styles.userImg} />
              <div style={{ color: '#FFA858', fontSize: '24px', marginBottom: '20px' }}>{'★'.repeat(rev.stars)}</div>
              <p className={styles.testimonialText}>{rev.text}</p>
              <h4 style={{ fontSize: '22px' }}>{rev.name}</h4>
              <p>{rev.role}</p>
            </div>
          ))}
        </div>
      </section>
    </>
  );
}
