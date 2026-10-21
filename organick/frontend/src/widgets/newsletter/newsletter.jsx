import { useState } from 'react';

export function Newsletter() {
  const [email, setEmail] = useState('');
  const [sent, setSent] = useState(false);

  const handleSubmit = (e) => {
    e.preventDefault();
    setSent(true);
    setEmail('');
    setTimeout(() => setSent(false), 3000);
  };

  return (
    <section style={{ padding: '100px 0' }}>
      <div className="container">
        <div style={{ background: 'url(https://images.unsplash.com/photo-1610832958506-aa56368176cf?q=80&w=2070&auto=format&fit=crop) center/cover', borderRadius: '30px', padding: '80px 70px', display: 'flex', justifyContent: 'space-between', alignItems: 'center', position: 'relative', overflow: 'hidden' }}>
          <div style={{ position: 'absolute', inset: 0, background: 'rgba(39, 76, 91, 0.7)' }}></div>
          <h2 style={{ position: 'relative', zIndex: 2, color: '#fff', fontSize: '45px', maxWidth: '400px', lineHeight: 1.2 }}>Subscribe to our Newsletter</h2>
          <form onSubmit={handleSubmit} style={{ position: 'relative', zIndex: 2, display: 'flex', gap: '10px' }}>
            <input type="email" placeholder="Your Email Address" value={email} onChange={e => setEmail(e.target.value)} required style={{ padding: '20px 30px', borderRadius: '16px', border: 'none', width: '350px', fontSize: '16px', outline: 'none' }} />
            <button type="submit" style={{ background: 'var(--primary)', color: '#fff', padding: '20px 40px', borderRadius: '16px', fontWeight: 'bold', fontSize: '16px' }}>{sent ? 'Sent!' : 'Subscribe'}</button>
          </form>
        </div>
      </div>
    </section>
  );
}
