import { createBrowserRouter, Outlet, ScrollRestoration } from 'react-router-dom';
import { Header } from '@/widgets/header/header';
import { Footer } from '@/widgets/footer/footer';
import { Newsletter } from '@/widgets/newsletter/newsletter';
import { CartDrawer } from '@/features/cart-drawer/cart-drawer';

// Pages
import { HomePage } from '@/pages/home/home';
import { ShopPage } from '@/pages/shop/shop';
import { ShopSinglePage } from '@/pages/shop-single/shop-single';
import { AboutPage } from '@/pages/about/about';
import { PortfolioPage } from '@/pages/portfolio/portfolio';
import { BlogPage } from '@/pages/blog/blog';
import { BlogSinglePage } from '@/pages/blog-single/blog-single';
import { ContactPage } from '@/pages/contact/contact';
import { NotFoundPage } from '@/pages/not-found/not-found';
import { ServicesPage } from '@/pages/services/services';
import { StyleGuidePage } from '@/pages/style-guide/style-guide';
import { LicensesPage } from '@/pages/licenses/licenses';
import { ChangelogPage } from '@/pages/changelog/changelog';
import { PasswordPage } from '@/pages/password/password';

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
      { path: 'services', element: <ServicesPage /> },
      { path: 'style-guide', element: <StyleGuidePage /> },
      { path: 'licenses', element: <LicensesPage /> },
      { path: 'changelog', element: <ChangelogPage /> },
      { path: 'password', element: <PasswordPage /> },
      { path: '*', element: <NotFoundPage /> },
    ],
  },
]);

export { router };
