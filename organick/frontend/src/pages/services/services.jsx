export function ServicesPage() {
  return (
    <>
      <div style={{ background: '#F1F8F4', padding: '80px 0', textAlign: 'center' }}>
        <h1 style={{ fontSize: '50px' }}>Services</h1>
      </div>
      <section style={{ padding: '100px 0', textAlign: 'center' }}>
        <div className="container">
          <span style={{ fontFamily: 'var(--font-script)', color: 'var(--secondary)', fontSize: '36px' }}>What we Grow</span>
          <h2 style={{ fontSize: '45px', marginBottom: '60px' }}>Better Agriculture for Better Future</h2>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: '30px' }}>
            {[1, 2, 3, 4, 5, 6].map(i => (
              <div key={i} style={{ textAlign: 'left', padding: '30px', background: '#F9F8F8', borderRadius: '30px' }}>
                <div style={{ fontSize: '40px', marginBottom: '20px' }}>🌱</div>
                <h3 style={{ fontSize: '22px', marginBottom: '15px' }}>Service Title {i}</h3>
                <p>Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.</p>
              </div>
            ))}
          </div>
        </div>
      </section>
    </>
  );
}
