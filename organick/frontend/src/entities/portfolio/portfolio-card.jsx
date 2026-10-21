export function PortfolioCard({ item }) {
  return (
    <div style={{ textAlign: 'center' }}>
      <img src={item.image} alt={item.title} style={{ width: '100%', height: '350px', objectFit: 'cover', borderRadius: '30px', marginBottom: '20px' }} />
      <h3 style={{ fontSize: '22px', color: 'var(--primary)', fontFamily: 'var(--font-heading)' }}>{item.title}</h3>
      <p style={{ color: 'var(--text)' }}>{item.category}</p>
    </div>
  );
}
