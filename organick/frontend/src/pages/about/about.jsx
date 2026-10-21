import { useTeam } from '@/shared/api/queries';
import { TeamCard } from '@/entities/team/team-card';
import { SectionTitle } from '@/shared/ui/section-title/section-title';

export function AboutPage() {
  const { data: team } = useTeam();
  return (
    <>
      <div style={{ background: '#F1F8F4', padding: '80px 0', textAlign: 'center' }}>
        <h1 style={{ fontSize: '50px' }}>About Us</h1>
      </div>
      <section style={{ padding: '120px 0' }}>
        <div className="container" style={{ display: 'flex', alignItems: 'center', gap: '80px' }}>
          <div style={{ flex: 1 }}>
            <span style={{ fontFamily: 'var(--font-script)', color: 'var(--secondary)', fontSize: '36px' }}>About Us</span>
            <h2 style={{ fontSize: '45px', lineHeight: 1.2, marginBottom: '30px', marginTop: '10px' }}>We do Creative Things for Success</h2>
            <p style={{ marginBottom: '30px', lineHeight: 1.8 }}>Simply dummy text of the printing and typesetting industry. Lorem had ceased to been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley.</p>
            <div style={{ display: 'flex', gap: '40px', marginTop: '40px' }}>
              <div>
                <h4 style={{ fontSize: '20px', marginBottom: '10px' }}>Modern Agriculture Equipment</h4>
              </div>
              <div>
                <h4 style={{ fontSize: '20px', marginBottom: '10px' }}>No growth hormones are used</h4>
              </div>
            </div>
          </div>
          <div style={{ flex: 1 }}><img src="/images/about-bowl.png" alt="About" style={{ width: '100%' }} /></div>
        </div>
      </section>

      <section style={{ padding: '100px 0', background: '#F9F8F8' }}>
        <div className="container">
          <SectionTitle script="Team" title="Our Organic Experts" />
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: '30px' }}>
            {team?.slice(0, 3).map(member => <TeamCard key={member.id} member={member} />)}
          </div>
        </div>
      </section>
    </>
  );
}
