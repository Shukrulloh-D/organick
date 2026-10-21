#!/bin/bash
cd frontend

# ==========================================
# 1. КОРЗИНА (Выдвижная панель)
# ==========================================
mkdir -p src/features/cart-drawer
cat > src/features/cart-drawer/cart-drawer.jsx << 'END'
import { useCartStore } from '@/shared/lib/useCartStore';

export function CartDrawer() {
  const { cart, isOpen, toggleCart, removeFromCart } = useCartStore();
  const total = cart.reduce((sum, item) => sum + item.price * (item.qty || 1), 0);

  if (!isOpen) return null;

  return (
    <div style={{ position: 'fixed', inset: 0, background: 'rgba(0,0,0,0.5)', zIndex: 9999, display: 'flex', justifyContent: 'flex-end' }} onClick={() => toggleCart(false)}>
      <div style={{ width: '400px', background: '#fff', height: '100%', padding: '30px', display: 'flex', flexDirection: 'column', animation: 'slideIn 0.3s forwards' }} onClick={e => e.stopPropagation()}>
        <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: '30px' }}>
          <h2 style={{ fontSize: '24px', fontFamily: 'var(--font-heading)' }}>Your Cart</h2>
          <button onClick={() => toggleCart(false)} style={{ fontSize: '24px' }}>✕</button>
        </div>
        
        <div style={{ flex: 1, overflowY: 'auto' }}>
          {cart.length === 0 ? <p style={{ color: '#777' }}>Your cart is empty.</p> : cart.map(item => (
            <div key={item.id} style={{ display: 'flex', gap: '15px', marginBottom: '20px', borderBottom: '1px solid #eee', paddingBottom: '15px' }}>
              <img src={item.image} style={{ width: '60px', height: '60px', objectFit: 'contain' }} />
              <div style={{ flex: 1 }}>
                <h4 style={{ fontSize: '14px', fontFamily: 'var(--font-heading)' }}>{item.title}</h4>
                <p style={{ fontSize: '12px', color: '#777' }}>{item.qty} x ${item.price}</p>
              </div>
              <button onClick={() => removeFromCart(item.id)} style={{ color: 'red' }}>✕</button>
            </div>
          ))}
        </div>

        <div style={{ borderTop: '1px solid #eee', paddingTop: '20px' }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: '20px', fontWeight: 'bold', marginBottom: '20px', fontFamily: 'var(--font-heading)' }}>
            <span>Total:</span>
            <span>${total.toFixed(2)}</span>
          </div>
          <button className="btn-primary" style={{ width: '100%' }}>Checkout</button>
        </div>
      </div>
    </div>
  );
}
END

# ==========================================
# 2. ROUTER (Сборка всех страниц)
# ==========================================
cat > src/app/router/index.jsx << 'END'
import { createBrowserRouter, RouterProvider, Outlet, ScrollRestoration } from 'react-router-dom';
import { Header } from '@/widgets/header/header';
import { Footer } from '@/widgets/footer/footer';
import { Newsletter } from '@/widgets/newsletter/newsletter';
import { CartDrawer } from '@/features/cart-drawer/cart-drawer';
import { HomePage } from '@/pages/home/home';
import { ShopPage } from '@/pages/shop/shop';
import { ShopSinglePage } from '@/pages/shop-single/shop-single';
import { AboutPage } from '@/pages/about/about';
import { PortfolioPage } from '@/pages/portfolio/portfolio';
import { BlogPage } from '@/pages/blog/blog';
import { BlogSinglePage } from '@/pages/blog-single/blog-single';
import { ContactPage } from '@/pages/contact/contact';
import { NotFoundPage } from '@/pages/not-found/not-found';

// Layout с хедером, футером и рассылкой (Оборачивает все страницы)
function Layout() {
  return (
    <>
      <Header />
      <main style={{ minHeight: '60vh' }}>
        <Outlet /> {/* Сюда вставляются страницы */}
      </main>
      <Newsletter />
      <Footer />
      <CartDrawer />
      <ScrollRestoration />
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
      { path: 'portfolio', element: <PortfolioPage /> },
      { path: 'blog', element: <BlogPage /> },
      { path: 'blog/:id', element: <BlogSinglePage /> },
      { path: 'contact', element: <ContactPage /> },
      { path: '*', element: <NotFoundPage /> },
    ],
  },
]);

export { router };
END

# ==========================================
# 3. PROVIDERS & APP
# ==========================================
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

echo "🎉 ВСЁ ГОТОВО! Роутинг, Корзина и Страницы собраны в единое приложение!"
