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
