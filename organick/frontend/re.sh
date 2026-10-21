#!/bin/bash
# В папке organick
cd frontend
npm install
npm install axios react-router-dom @tanstack/react-query zustand

# Структура FSD
mkdir -p src/app/{providers,router,styles}
mkdir -p src/pages/{home,shop,shop-single,about,not-found}
mkdir -p src/widgets/{header,footer,newsletter}
mkdir -p src/features/{add-to-cart,cart-drawer}
mkdir -p src/entities/{product,category}
mkdir -p src/shared/{api,ui/{button,input,logo,skeleton},lib,config}

# Настройки Vite (алиасы)
cat > vite.config.js << 'END'
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import path from 'path';

export default defineConfig({
  plugins: [react()],
  resolve: { alias: { '@': path.resolve(__dirname, './src') } },
});
END

cat > jsconfig.json << 'END'
{
  "compilerOptions": { "baseUrl": ".", "paths": { "@/*": ["src/*"] } },
  "include": ["src"]
}
END

cat > index.html << 'END'
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Organick — Healthy Food</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500;600;700&family=Roboto:wght@400;500;700;900&family=Yellowtail&display=swap" rel="stylesheet">
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.jsx"></script>
  </body>
</html>
END

# ГЛОБАЛЬНЫЕ СТИЛИ (Цвета из Style Guide)
cat > src/app/styles/index.css << 'END'
:root {
  --primary: #274C5B;
  --secondary: #7EB693;
  --accent: #EFD372;
  --bg: #F9F8F8;
  --bg-light: #EFF6F1;
  --text: #525C60;
  --font-heading: 'Roboto', sans-serif;
  --font-body: 'Open Sans', sans-serif;
  --font-script: 'Yellowtail', cursive;
}
* { margin: 0; padding: 0; box-sizing: border-box; }
body { font-family: var(--font-body); color: var(--text); background: #fff; }
img { max-width: 100%; display: block; }
a { text-decoration: none; color: inherit; }
button { cursor: pointer; border: none; font-family: inherit; }
h1, h2, h3, h4 { font-family: var(--font-heading); color: var(--primary); font-weight: 800; }
.container { max-width: 1380px; margin: 0 auto; padding: 0 20px; }

/* Утилиты */
.script-title { font-family: var(--font-script); color: var(--secondary); font-size: 36px; font-weight: 400; display: block; margin-bottom: 10px; }
.section-title { font-size: 45px; line-height: 1.2; margin-bottom: 30px; }
.btn-primary { background: var(--primary); color: #fff; padding: 20px 35px; border-radius: 16px; font-weight: 700; font-family: var(--font-heading); display: inline-flex; align-items: center; gap: 10px; transition: 0.3s; }
.btn-primary:hover { background: #1a3642; transform: translateY(-3px); }
.btn-accent { background: var(--accent); color: var(--primary); padding: 20px 35px; border-radius: 16px; font-weight: 700; font-family: var(--font-heading); display: inline-flex; align-items: center; gap: 10px; transition: 0.3s; }
.btn-accent:hover { background: #e2c35a; transform: translateY(-3px); }
END

# API & QUERIES
cat > src/shared/api/client.js << 'END'
import axios from 'axios';
export const api = axios.create({ baseURL: 'http://localhost:3001/api' });
END

cat > src/shared/api/queries.js << 'END'
import { useQuery } from '@tanstack/react-query';
import { api } from './client';

export const useProducts = () => useQuery({
  queryKey: ['products'],
  queryFn: async () => (await api.get('/products')).data
});

export const useProduct = (id) => useQuery({
  queryKey: ['product', id],
  queryFn: async () => (await api.get(`/products/${id}`)).data,
  enabled: !!id
});
END

# ZUSTAND CART STORE
cat > src/shared/lib/useCartStore.js << 'END'
import { create } from 'zustand';

export const useCartStore = create((set) => ({
  cart: [],
  isOpen: false,
  addToCart: (product) => set((state) => {
    const existing = state.cart.find(item => item.id === product.id);
    if (existing) return { cart: state.cart.map(item => item.id === product.id ? { ...item, qty: item.qty + 1 } : item) };
    return { cart: [...state.cart, { ...product, qty: 1 }], isOpen: true };
  }),
  removeFromCart: (id) => set((state) => ({ cart: state.cart.filter(item => item.id !== id) })),
  toggleCart: (isOpen) => set({ isOpen }),
}));
END

echo "✅ Фронтенд база и Shared готовы!"
