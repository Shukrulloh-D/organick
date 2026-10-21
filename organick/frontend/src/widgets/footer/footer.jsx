import { Logo } from '@/shared/ui/logo/logo';

export function Footer() {
  return (
    <footer style={{ background: '#F1F8F4', padding: '100px 0 30px' }}>
      <div className="container">
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 2fr 1fr', gap: '50px', marginBottom: '50px' }}>
          <div style={{ textAlign: 'right' }}>
            <h3 style={{ fontSize: '30px', color: 'var(--primary)', marginBottom: '30px', fontFamily: 'var(--font-heading)' }}>Contact Us</h3>
            <p style={{ lineHeight: 2 }}><strong>Email:</strong><br/>needhelp@Organick.com</p>
            <p style={{ marginTop: '20px', lineHeight: 2 }}><strong>Phone:</strong><br/>666 888 888</p>
            <p style={{ marginTop: '20px', lineHeight: 2 }}><strong>Address:</strong><br/>88 road, brooklyn street, USA</p>
          </div>
          <div style={{ textAlign: 'center', borderLeft: '1px solid #D4D4D4', borderRight: '1px solid #D4D4D4', padding: '0 30px' }}>
            <Logo />
            <p style={{ marginTop: '20px', color: 'var(--text)', lineHeight: 1.8 }}>Simply dummy text of the printing and typesetting industry. Lorem Ipsum simply dummy text of the printing.</p>
            <div style={{ display: 'flex', gap: '15px', marginTop: '20px', justifyContent: 'center' }}>
              <a href="#" style={{ width: '40px', height: '40px', borderRadius: '50%', background: 'var(--primary)', color: '#fff', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>f</a>
              <a href="#" style={{ width: '40px', height: '40px', borderRadius: '50%', background: 'var(--primary)', color: '#fff', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>t</a>
              <a href="#" style={{ width: '40px', height: '40px', borderRadius: '50%', background: 'var(--primary)', color: '#fff', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>in</a>
            </div>
          </div>
          <div>
            <h3 style={{ fontSize: '30px', color: 'var(--primary)', marginBottom: '30px', fontFamily: 'var(--font-heading)' }}>Utility Pages</h3>
            <p style={{ marginBottom: '15px' }}>Style Guide</p>
            <p style={{ marginBottom: '15px' }}>404 Not Found</p>
            <p style={{ marginBottom: '15px' }}>Password Protected</p>
            <p style={{ marginBottom: '15px' }}>Licenses</p>
            <p>Changelog</p>
          </div>
        </div>
        <div style={{ textAlign: 'center', borderTop: '1px solid #D4D4D4', paddingTop: '30px', color: 'var(--text)' }}>
          Copyright © <strong>Organick</strong>
        </div>
      </div>
    </footer>
  );
}
