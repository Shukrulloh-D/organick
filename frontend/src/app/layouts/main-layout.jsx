import { Outlet, ScrollRestoration } from 'react-router-dom';
import { Header } from '@/widgets/header/header';
import { Footer } from '@/widgets/footer/footer';
import { Newsletter } from '@/widgets/newsletter/newsletter';
import { CartDrawer } from '@/features/cart-drawer/cart-drawer';

export function MainLayout() {
  return (
    <>
      <Header />
      <main style={{ minHeight: '60vh' }}>
        <Outlet />
      </main>
      <Newsletter />
      <Footer />
      <CartDrawer />
      <ScrollRestoration />
    </>
  );
}
