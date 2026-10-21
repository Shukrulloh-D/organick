export function ContactPage() {
  return (
    <>
      <div style={{ background: '#F1F8F4', padding: '80px 0', textAlign: 'center' }}>
        <h1 style={{ fontSize: '50px' }}>Contact Us</h1>
      </div>
      <section style={{ padding: '100px 0' }}>
        <div className="container" style={{ display: 'flex', gap: '50px' }}>
          <div style={{ flex: 1 }}>
            <h2 style={{ fontSize: '40px', marginBottom: '20px' }}>We'd love to talk about how we can work together.</h2>
            <p style={{ color: 'var(--text)', marginBottom: '40px' }}>Simply dummy text of the printing and typesetting industry. Lorem had ceased to been the industry's standard dummy text ever since the 1500s.</p>
            <div style={{ display: 'flex', flexDirection: 'column', gap: '20px' }}>
              <div style={{ background: '#F9F8F8', padding: '20px', borderRadius: '16px' }}>📧 <strong>Message:</strong> needhelp@Organick.com</div>
              <div style={{ background: '#F9F8F8', padding: '20px', borderRadius: '16px' }}>📞 <strong>Contact:</strong> +1 (78) 673 3567</div>
            </div>
          </div>
          <div style={{ flex: 1, background: '#F1F8F4', padding: '50px', borderRadius: '30px' }}>
            <form style={{ display: 'flex', flexDirection: 'column', gap: '20px' }}>
              <input type="text" placeholder="Full Name" style={{ padding: '15px', borderRadius: '10px', border: '1px solid #ddd' }} />
              <input type="email" placeholder="Your Email" style={{ padding: '15px', borderRadius: '10px', border: '1px solid #ddd' }} />
              <textarea placeholder="Write Message..." rows="5" style={{ padding: '15px', borderRadius: '10px', border: '1px solid #ddd', resize: 'none' }}></textarea>
              <button type="button" className="btn-primary">Send Message ↗</button>
            </form>
          </div>
        </div>
      </section>
    </>
  );
}
