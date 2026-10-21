import { useTeam } from '@/shared/api/queries';
import { TeamCard } from '@/entities/team/team-card';
import { SectionTitle } from '@/shared/ui/section-title/section-title';

export function TeamPage() {
  const { data: team } = useTeam();
  return (
    <>
      <div style={{ background: '#F1F8F4', padding: '80px 0', textAlign: 'center' }}>
        <h1 style={{ fontSize: '50px' }}>Our Team</h1>
      </div>
      <section style={{ padding: '100px 0' }}>
        <div className="container">
          <SectionTitle script="Team" title="Our Organic Experts" />
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: '30px' }}>
            {team?.map(member => <TeamCard key={member.id} member={member} />)}
          </div>
        </div>
      </section>
    </>
  );
}
