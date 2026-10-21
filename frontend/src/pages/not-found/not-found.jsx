import { Link } from 'react-router-dom';

export function NotFoundPage() {
  return (
    <div style={{ padding: '150px 0', textAlign: 'center', background: '#F1F8F4', minHeight: '60vh' }}>
      <div className="container">
        <h1 style={{ fontSize: '200px', lineHeight: 1, color: 'var(--primary)' }}>404</h1>
        <h2 style={{ fontSize: '40px', marginBottom: '20px' }}>Page not found</h2>
        <p style={{ marginBottom: '40px' }}>The page you are looking for doesn't exist or has been moved.</p>
        <Link to="/" className="btn-primary">Go to Homepage</Link>
      </div>
    </div>
  );
}
