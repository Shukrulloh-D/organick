export function Rating({ value }) {
  return <div style={{ color: '#FFA858', fontSize: '18px', letterSpacing: '2px' }}>{'★'.repeat(value)}{'☆'.repeat(5 - value)}</div>;
}
