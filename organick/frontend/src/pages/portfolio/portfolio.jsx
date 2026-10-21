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
