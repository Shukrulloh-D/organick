import { createBrowserRouter } from 'react-router-dom';
import { MainLayout } from '@/app/layouts/main-layout';

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
import { TeamPage } from '@/pages/team/team';

const router = createBrowserRouter([
  {
    path: '/',
    element: <MainLayout />,
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
      { path: 'team', element: <TeamPage /> },
      { path: '*', element: <NotFoundPage /> },
    ],
  },
]);

export { router };
