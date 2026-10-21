#!/bin/bash
cd frontend

# ==========================================
# 1. КРАСИВЫЙ СКРОЛЛБАР (Вместо системного)
# ==========================================
cat > src/app/styles/index.css << 'END'
/* ... твой предыдущий код ... */
:root {
  --primary: #274C5B; --secondary: #7EB693; --accent: #EFD372;
  --bg: #F9F8F8; --bg-light: #EFF6F1; --text: #525C60;
  --font-heading: 'Roboto', sans-serif; --font-body: 'Open Sans', sans-serif; --font-script: 'Yellowtail', cursive;
}
* { margin: 0; padding: 0; box-sizing: border-box; }
body { font-family: var(--font-body); color: var(--text); background: #fff; }
img { max-width: 100%; display: block; }
a { text-decoration: none; color: inherit; }
button { cursor: pointer; border: none; font-family: inherit; }
h1, h2, h3, h4 { font-family: var(--font-heading); color: var(--primary); font-weight: 800; }
.container { max-width: 1380px; margin: 0 auto; padding: 0 20px; }

/* Убираем стандартный скролл и делаем кастомный тонкий */
::-webkit-scrollbar { width: 8px; }
::-webkit-scrollbar-track { background: #F1F8F4; }
::-webkit-scrollbar-thumb { background: var(--secondary); border-radius: 4px; }
::-webkit-scrollbar-thumb:hover { background: var(--primary); }

/* Скрываем скролл в корзине */
.no-scrollbar::-webkit-scrollbar { display: none; }
.no-scrollbar { -ms-overflow-style: none; scrollbar-width: none; }
END

# Фикс скролла в корзине
sed -i 's/style={{ flex: 1, overflowY: .auto. }}/className="no-scrollbar" style={{ flex: 1, overflowY: "auto" }}/' src/features/cart-drawer/cart-drawer.jsx

# ==========================================
# 2. НОВЫЕ ВИДЖЕТЫ (Stats и Eco)
# ==========================================
mkdir -p src/widgets/stats src/widgets/eco-friendly

cat > src/widgets/stats/stats.jsx << 'END'
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
END

# Внедряем Stats на главную (в конец секции Testimonial)
cat > /tmp/stats_inject.txt << 'END'
import { Stats } from '@/widgets/stats/stats';
// Вставляем <Stats /> после секции Testimonial
END

# ==========================================
# 3. НОВЫЕ СТРАНИЦЫ (Services, Style Guide, Utility)
# ==========================================
mkdir -p src/pages/{services,style-guide,licenses,changelog,password}

# --- SERVICES ---
cat > src/pages/services/services.jsx << 'END'
export function ServicesPage() {
  return (
    <>
      <div style={{ background: '#F1F8F4', padding: '80px 0', textAlign: 'center' }}>
        <h1 style={{ fontSize: '50px' }}>Services</h1>
      </div>
      <section style={{ padding: '100px 0', textAlign: 'center' }}>
        <div className="container">
          <span style={{ fontFamily: 'var(--font-script)', color: 'var(--secondary)', fontSize: '36px' }}>What we Grow</span>
          <h2 style={{ fontSize: '45px', marginBottom: '60px' }}>Better Agriculture for Better Future</h2>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: '30px' }}>
            {[1, 2, 3, 4, 5, 6].map(i => (
              <div key={i} style={{ textAlign: 'left', padding: '30px', background: '#F9F8F8', borderRadius: '30px' }}>
                <div style={{ fontSize: '40px', marginBottom: '20px' }}>🌱</div>
                <h3 style={{ fontSize: '22px', marginBottom: '15px' }}>Service Title {i}</h3>
                <p>Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.</p>
              </div>
            ))}
          </div>
        </div>
      </section>
    </>
  );
}
END

# --- STYLE GUIDE ---
cat > src/pages/style-guide/style-guide.jsx << 'END'
export function StyleGuidePage() {
  return (
    <section style={{ padding: '100px 0' }}>
      <div className="container">
        <h1 style={{ fontSize: '50px', marginBottom: '50px' }}>Style Guide</h1>
        
        <h2 style={{ fontSize: '30px', marginBottom: '20px' }}>Colors</h2>
        <div style={{ display: 'flex', gap: '20px', marginBottom: '50px' }}>
          <div style={{ width: '100px', height: '100px', background: 'var(--primary)', borderRadius: '10px' }}></div>
          <div style={{ width: '100px', height: '100px', background: 'var(--secondary)', borderRadius: '10px' }}></div>
          <div style={{ width: '100px', height: '100px', background: 'var(--accent)', borderRadius: '10px' }}></div>
          <div style={{ width: '100px', height: '100px', background: 'var(--bg)', borderRadius: '10px', border: '1px solid #ddd' }}></div>
        </div>

        <h2 style={{ fontSize: '30px', marginBottom: '20px' }}>Typography</h2>
        <div style={{ marginBottom: '50px' }}>
          <h1>Display H1 Text</h1>
          <h2>Heading H2 Text</h2>
          <h3>Heading H3 Text</h3>
          <h4>Heading H4 Text</h4>
          <h5>Heading H5 Text</h5>
          <h6>Heading H6 Text</h6>
          <p style={{ marginTop: '20px', maxWidth: '800px' }}>Paragraph: Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley.</p>
        </div>

        <h2 style={{ fontSize: '30px', marginBottom: '20px' }}>Buttons</h2>
        <div style={{ display: 'flex', gap: '20px' }}>
          <button className="btn-primary">Default Button ↗</button>
          <button className="btn-accent">Accent Button ↗</button>
        </div>
      </div>
    </section>
  );
}
END

# --- UTILITY PAGES (Licenses, Changelog, Password) ---
cat > src/pages/licenses/licenses.jsx << 'END'
export function LicensesPage() {
  return (
    <section style={{ padding: '100px 0', maxWidth: '800px', margin: '0 auto' }}>
      <div className="container">
        <h1 style={{ fontSize: '40px', marginBottom: '30px' }}>Licenses</h1>
        <h3 style={{ fontSize: '24px', marginBottom: '15px' }}>Icon & Graphics</h3>
        <p style={{ marginBottom: '30px' }}>All icons and graphics are free to use and commercially available. They are created by our design team and can be used in any project.</p>
        <h3 style={{ fontSize: '24px', marginBottom: '15px' }}>Photography</h3>
        <p>All images are sourced from Unsplash and Pexels. They are free to use for commercial purposes without attribution.</p>
      </div>
    </section>
  );
}
END

cat > src/pages/changelog/changelog.jsx << 'END'
export function ChangelogPage() {
  return (
    <section style={{ padding: '100px 0', maxWidth: '800px', margin: '0 auto' }}>
      <div className="container">
        <h1 style={{ fontSize: '40px', marginBottom: '30px' }}>Changelog</h1>
        <div style={{ background: '#F9F8F8', padding: '30px', borderRadius: '20px' }}>
          <h3 style={{ fontSize: '22px' }}>v.1.0.0</h3>
          <p style={{ color: 'var(--text)', marginTop: '10px' }}>Initial release of the Organick template.</p>
        </div>
      </div>
    </section>
  );
}
END

cat > src/pages/password/password.jsx << 'END'
export function PasswordPage() {
  return (
    <section style={{ padding: '150px 0', textAlign: 'center', background: '#F1F8F4', minHeight: '60vh' }}>
      <div className="container" style={{ maxWidth: '500px' }}>
        <h2 style={{ fontSize: '40px', marginBottom: '20px' }}>Protected Page</h2>
        <p style={{ marginBottom: '30px' }}>This page is password protected. Please enter the password to view.</p>
        <input type="password" placeholder="Enter Password" style={{ width: '100%', padding: '20px', borderRadius: '16px', border: '1px solid #ddd', marginBottom: '20px' }} />
        <button className="btn-primary" style={{ width: '100%' }}>Submit Now</button>
      </div>
    </section>
  );
}
END

echo "✅ Новые страницы и фиксы готовы!"
