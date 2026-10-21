cat > README.md << 'END'
# 🌿 Organick — Organic Food E-commerce

Полноценный многостраничный E-commerce проект (Frontend + Backend), разработанный с использованием современных стандартов и архитектуры FSD.

## 🚀 Стек технологий

**Frontend:**
- ⚛️ **React 18** + **Vite**
- 🏗️ **Feature-Sliced Design (FSD)** — профессиональная архитектура
- 🛣️ **React Router DOM v6** — клиентский роутинг (SPA)
- 🔄 **TanStack React Query** — управление серверным состоянием и кэширование
- 🐻 **Zustand** — легковесный и быстрый стейт-менеджер (для корзины)
- 🎨 **CSS Modules / Vanilla CSS** — стилизация без тяжелых библиотек

**Backend:**
- 🟢 **Node.js + Express**
- 🏛️ **MVC Паттерн** (Routes -> Controllers -> Data)
- 📦 **Mock Data** (эмуляция БД)

## 📁 Архитектура (FSD)

Проект строго следует методологии **Feature-Sliced Design**:

```text
frontend/src/
├── app/          # Инициализация (провайдеры, роутер, стили)
├── pages/        # Страницы (Home, Shop, ShopSingle, About, 404)
├── widgets/      # Крупные блоки (Header, Footer, Newsletter)
├── features/     # Действия пользователя (CartDrawer)
├── entities/     # Сущности (ProductCard)
└── shared/       # Переиспользуемое (API, UI kit, Zustand store, Utils)
