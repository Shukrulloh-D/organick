export function TeamCard({ member }) {
  return (
    <div style={{ background: '#F9F8F8', borderRadius: '30px', overflow: 'hidden', textAlign: 'center' }}>
      <img src={member.image} alt={member.name} style={{ width: '100%', height: '350px', objectFit: 'cover' }} />
      <div style={{ padding: '20px' }}>
        <h3 style={{ fontSize: '22px', color: 'var(--primary)', fontFamily: 'var(--font-heading)' }}>{member.name}</h3>
        <p style={{ color: 'var(--text)', marginBottom: '15px' }}>{member.role}</p>
      </div>
    </div>
  );
}
