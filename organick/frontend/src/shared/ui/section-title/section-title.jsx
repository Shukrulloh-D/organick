export function SectionTitle({ script, title, align = 'center' }) {
  return (
    <div style={{ textAlign: align, marginBottom: '50px' }}>
      {script && <span style={{ fontFamily: 'var(--font-script)', color: 'var(--secondary)', fontSize: '36px', display: 'block', marginBottom: '10px' }}>{script}</span>}
      <h2 style={{ fontSize: '45px', fontFamily: 'var(--font-heading)', color: 'var(--primary)', fontWeight: 800 }}>{title}</h2>
    </div>
  );
}
