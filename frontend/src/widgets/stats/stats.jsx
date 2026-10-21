export function Stats() {
  const data = [
    { value: '100%', label: 'Organic' },
    { value: '285', label: 'Active Product' },
    { value: '350+', label: 'Organic Orchads' },
    { value: '25+', label: 'Years of Farming' },
  ];
  return (
    <div className="container" style={{ display: 'flex', justifyContent: 'space-between', padding: '60px 0', background: '#fff', margin: '0 auto', maxWidth: '1000px' }}>
      {data.map((item, i) => (
        <div key={i} style={{ textAlign: 'center', border: '2px solid var(--secondary)', borderRadius: '50%', width: '150px', height: '150px', display: 'flex', flexDirection: 'column', justifyContent: 'center' }}>
          <h3 style={{ fontSize: '36px', marginBottom: '5px' }}>{item.value}</h3>
          <p style={{ fontSize: '14px' }}>{item.label}</p>
        </div>
      ))}
    </div>
  );
}
