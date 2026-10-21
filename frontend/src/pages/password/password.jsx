export function PasswordPage() {
  return (
    <section style={{ padding: '150px 0', textAlign: 'center', background: '#F1F8F4', minHeight: '60vh' }}>
      <div className="container" style={{ maxWidth: '500px' }}>
        <h2 style={{ fontSize: '40px', marginBottom: '20px' }}>Protected Page</h2>
        <p style={{ marginBottom: '30px' }}>This page is password protected. Please enter the password to view.</p>
        <input type="password" placeholder="Enter Password" style={{ width: '100%', padding: '20px', borderRadius: '16px', border: '1px solid #ddd', marginBottom: '20px' }} />
        <button className="btn-primary" style={{ width: '100%' }}>Submit Now</button>
      </div>
    </section>
  );
}
