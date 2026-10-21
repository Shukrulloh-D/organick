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
