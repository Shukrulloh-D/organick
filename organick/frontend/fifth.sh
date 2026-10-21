#!/bin/bash
cd frontend

# ==========================================
# PAGES: HOME
# ==========================================
cat > src/pages/home/home.jsx << 'END'
import { Link } from 'react-router-dom';
import { useProducts } from '@/shared/api/queries';
import { ProductCard } from '@/entities/product/product-card';
import { Button } from '@/shared/ui/button/button';

export function HomePage() {
  const { data: products, isLoading } = useProducts();

  return (
    <>
      {/* HERO SECTION */}
      <section style={{ background: '#F1F8F4', padding: '100px 0', position: 'relative' }}>
        <div className="container" style={{ display: 'flex', alignItems: 'center', gap: '50px' }}>
          <div style={{ flex: 1 }}>
            <span className="script-title">100% Natural Food</span>
            <h1 style={{ fontSize: '70px', lineHeight: 1.1, marginBottom: '30px' }}>Choose the best healthier way of life</h1>
            <Link to="/shop"><Button variant="accent">Explore Now ↗</Button></Link>
          </div>
          <div style={{ flex: 1 }}>
            <img src="/images/hero-food.png" alt="Healthy Food" style={{ width: '100%' }} />
          </div>
        </div>
      </section>

      {/* ABOUT SECTION (Скрин 5) */}
      <section style={{ padding: '120px 0' }}>
        <div className="container" style={{ display: 'flex', alignItems: 'center', gap: '80px' }}>
          <div style={{ flex: 1 }}>
             <img src="/images/about-fruits.png" alt="About" style={{ width: '100%' }} />
          </div>
          <div style={{ flex: 1 }}>
            <span className="script-title">About Us</span>
            <h2 className="section-title">We Believe in Working Accredited Farmers</h2>
            <p style={{ marginBottom: '30px', lineHeight: 1.8 }}>Simply dummy text of the printing and typesetting industry. Lorem had ceased to been the industry's standard dummy text ever since the 1500s.</p>
            
            <div style={{ display: 'flex', gap: '20px', marginBottom: '40px' }}>
              <div style={{ background: '#F1F8F4', padding: '20px', borderRadius: '20px', fontSize: '30px' }}>🥗</div>
              <div>
                <h4 style={{ fontSize: '20px', marginBottom: '10px' }}>Organic Foods Only</h4>
                <p>Simply dummy text of the printing and typesetting industry. Lorem Ipsum</p>
              </div>
            </div>
            <Link to="/shop"><Button variant="primary">Shop Now ↗</Button></Link>
          </div>
        </div>
      </section>

      {/* PRODUCTS SECTION (Скрин 6) */}
      <section style={{ background: '#F9F8F8', padding: '120px 0' }}>
        <div className="container">
          <div style={{ textAlign: 'center', marginBottom: '60px' }}>
            <span className="script-title">Categories</span>
            <h2 className="section-title">Our Products</h2>
          </div>
          {isLoading ? <p>Loading...</p> : (
            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: '20px' }}>
              {products?.slice(0, 8).map(product => <ProductCard key={product.id} product={product} />)}
            </div>
          )}
          <div style={{ textAlign: 'center', marginTop: '50px' }}>
            <Link to="/shop"><Button variant="primary">Load More ↗</Button></Link>
          </div>
        </div>
      </section>

      {/* TESTIMONIAL (Скрин 7) */}
      <section style={{ padding: '120px 0', textAlign: 'center', background: '#F1F8F4' }}>
        <div className="container">
          <span className="script-title">Testimonial</span>
          <h2 className="section-title">What Our Customer Saying?</h2>
          <img src="/images/user.png" alt="User" style={{ width: '100px', height: '100px', borderRadius: '50%', margin: '0 auto 20px' }} />
          <div style={{ color: '#FFA858', fontSize: '24px', marginBottom: '20px' }}>★★★★★</div>
          <p style={{ maxWidth: '800px', margin: '0 auto 30px', fontSize: '18px', lineHeight: 1.8 }}>Simply dummy text of the printing and typesetting industry. Lorem Ipsum simply dummy text of the printing and typesetting industry. Lorem Ipsum has been.</p>
          <h4 style={{ fontSize: '22px' }}>Sara Taylor</h4>
          <p>Consumer</p>
        </div>
      </section>
    </>
  );
}
END

# ==========================================
# PAGES: SHOP
# ==========================================
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
# PAGES: SHOP SINGLE (Скрин 15)
# ==========================================
cat > src/pages/shop-single/shop-single.jsx << 'END'
import { useParams, Link } from 'react-router-dom';
import { useProduct, useProducts } from '@/shared/api/queries';
import { useCartStore } from '@/shared/lib/useCartStore';
import { Button } from '@/shared/ui/button/button';
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
              <Button variant="primary" onClick={() => addToCart({ ...product, qty })}>Add To Cart ↗</Button>
            </div>
          </div>
        </div>
      </section>

      {/* Related Products */}
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
# PAGES: ABOUT (Скрин 12)
# ==========================================
cat > src/pages/about/about.jsx << 'END'
export function AboutPage() {
  return (
    <>
      <div style={{ background: '#F1F8F4', padding: '80px 0', textAlign: 'center' }}>
        <h1 style={{ fontSize: '50px' }}>About Us</h1>
      </div>
      <section style={{ padding: '120px 0' }}>
        <div className="container" style={{ display: 'flex', alignItems: 'center', gap: '80px' }}>
          <div style={{ flex: 1 }}>
            <span className="script-title">About Us</span>
            <h2 className="section-title">We do Creative Things for Success</h2>
            <p style={{ marginBottom: '30px', lineHeight: 1.8 }}>Simply dummy text of the printing and typesetting industry. Lorem had ceased to been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley.</p>
            <p style={{ marginBottom: '40px', lineHeight: 1.8 }}>Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley.</p>
            <div style={{ display: 'flex', gap: '40px' }}>
              <div>
                <h4 style={{ fontSize: '20px', marginBottom: '10px' }}>Modern Agriculture Equipment</h4>
              </div>
              <div>
                <h4 style={{ fontSize: '20px', marginBottom: '10px' }}>No growth hormones are used</h4>
              </div>
            </div>
          </div>
          <div style={{ flex: 1 }}>
            <img src="/images/about-bowl.png" alt="About" style={{ width: '100%' }} />
          </div>
        </div>
      </section>
    </>
  );
}
END

# ==========================================
# PAGES: 404
# ==========================================
cat > src/pages/not-found/not-found.jsx << 'END'
import { Link } from 'react-router-dom';
import { Button } from '@/shared/ui/button/button';

export function NotFoundPage() {
  return (
    <div style={{ padding: '150px 0', textAlign: 'center', background: '#F1F8F4' }}>
      <div className="container">
        <h1 style={{ fontSize: '200px', lineHeight: 1, color: 'var(--primary)' }}>404</h1>
        <h2 style={{ fontSize: '40px', marginBottom: '20px' }}>Page not found</h2>
        <p style={{ marginBottom: '40px' }}>The page you are looking for doesn't exist or has been moved.</p>
        <Link to="/"><Button variant="primary">Go to Homepage</Button></Link>
      </div>
    </div>
  );
}
END

# ==========================================
# ROUTER & APP
# ==========================================
cat > src/app/router/index.jsx << 'END'
import { createBrowserRouter, RouterProvider, Outlet } from 'react-router-dom';
import { Header } from '@/widgets/header/header';
import { Footer } from '@/widgets/footer/footer';
import { Newsletter } from '@/widgets/newsletter/newsletter';
import { CartDrawer } from '@/features/cart-drawer/cart-drawer';
import { HomePage } from '@/pages/home/home';
import { ShopPage } from '@/pages/shop/shop';
import { ShopSinglePage } from '@/pages/shop-single/shop-single';
import { AboutPage } from '@/pages/about/about';
import { NotFoundPage } from '@/pages/not-found/not-found';

// Layout с хедером, футером и рассылкой
function Layout() {
  return (
    <>
      <Header />
      <main style={{ minHeight: '60vh' }}>
        <Outlet />
      </main>
      <Newsletter />
      <Footer />
      <CartDrawer />
    </>
  );
}

const router = createBrowserRouter([
  {
    path: '/',
    element: <Layout />,
    children: [
      { index: true, element: <HomePage /> },
      { path: 'shop', element: <ShopPage /> },
      { path: 'shop/:id', element: <ShopSinglePage /> },
      { path: 'about', element: <AboutPage /> },
      { path: '*', element: <NotFoundPage /> },
    ],
  },
]);

export { router };
END

cat > src/app/providers.jsx << 'END'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';

const queryClient = new QueryClient({ defaultOptions: { queries: { staleTime: 60000 } } });

export function Providers({ children }) {
  return <QueryClientProvider client={queryClient}>{children}</QueryClientProvider>;
}
END

cat > src/app/app.jsx << 'END'
import { Providers } from './providers';
import { RouterProvider } from 'react-router-dom';
import { router } from './router';

export function App() {
  return (
    <Providers>
      <RouterProvider router={router} />
    </Providers>
  );
}
END

cat > src/main.jsx << 'END'
import React from 'react';
import ReactDOM from 'react-dom/client';
import { App } from '@/app/app';
import '@/app/styles/index.css';

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
END

echo "🎉 ВСЕ ПАГИ, РОУТИНГ И СБОРКА ГОТОВЫ!"
