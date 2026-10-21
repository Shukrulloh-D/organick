export function StyleGuidePage() {
  return (
    <section style={{ padding: '100px 0' }}>
      <div className="container">
        <h1 style={{ fontSize: '50px', marginBottom: '50px' }}>Style Guide</h1>
        
        <h2 style={{ fontSize: '30px', marginBottom: '20px' }}>Colors</h2>
        <div style={{ display: 'flex', gap: '20px', marginBottom: '50px' }}>
          <div style={{ width: '100px', height: '100px', background: 'var(--primary)', borderRadius: '10px' }}></div>
          <div style={{ width: '100px', height: '100px', background: 'var(--secondary)', borderRadius: '10px' }}></div>
          <div style={{ width: '100px', height: '100px', background: 'var(--accent)', borderRadius: '10px' }}></div>
          <div style={{ width: '100px', height: '100px', background: 'var(--bg)', borderRadius: '10px', border: '1px solid #ddd' }}></div>
        </div>

        <h2 style={{ fontSize: '30px', marginBottom: '20px' }}>Typography</h2>
        <div style={{ marginBottom: '50px' }}>
          <h1>Display H1 Text</h1>
          <h2>Heading H2 Text</h2>
          <h3>Heading H3 Text</h3>
          <h4>Heading H4 Text</h4>
          <h5>Heading H5 Text</h5>
          <h6>Heading H6 Text</h6>
          <p style={{ marginTop: '20px', maxWidth: '800px' }}>Paragraph: Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley.</p>
        </div>

        <h2 style={{ fontSize: '30px', marginBottom: '20px' }}>Buttons</h2>
        <div style={{ display: 'flex', gap: '20px' }}>
          <button className="btn-primary">Default Button ↗</button>
          <button className="btn-accent">Accent Button ↗</button>
        </div>
      </div>
    </section>
  );
}
