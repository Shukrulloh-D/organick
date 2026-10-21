import { Link } from 'react-router-dom';
export function Logo() {
  return (
    <Link to="/" style={{ display: 'flex', alignItems: 'center', gap: '8px', fontSize: '32px', fontWeight: 800, color: 'var(--primary)', fontFamily: 'var(--font-heading)' }}>
      <span style={{ fontSize: '40px' }}>🌿</span> Organick
    </Link>
  );
}
