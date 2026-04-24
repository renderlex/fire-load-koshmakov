# 🚀 GitHub Pages Deployment Instructions

## ✅ Поточний статус
Локальний репозиторій **повністю готовий** до push на GitHub.

**Структура для публікації:**
- ✅ `index.html` - основна сторінка (VS Code тема)
- ✅ `data.json` - база 67 речовин
- ✅ `README.md` - документація
- ✅ `fire-load-app/` - динамічна версія (опціонально)
- ✅ `fire-load-public/` - статична версія

---

## 📋 Кроки для публікації

### **Крок 1: Створити репозиторій на GitHub**
1. Перейди на **https://github.com/new**
2. Заповни поля:
   - **Repository name:** `renderlex.github.io`
   - **Description:** Fire Load Database - Bilingual Reference (Koshmakov 67 elements)
   - **Public:** ✅ обрано
   - **Initialize:** ❌ НЕ обирай
3. Натисни **Create repository**

> ⚠️ **ВАЖЛИВО:** Не ініціалізуй README, .gitignore чи license - репозиторій має бути порожній!

---

### **Крок 2: Push з локального комп'ютера**
Скопіюй і запусти ці команди в PowerShell:

```powershell
cd "G:\Мій диск\AI_project\site_for_google"

# Спроба 1 - HTTPS з токеном (рекомендується)
git push -u origin main
# Система попросить GitHub token - надай свій Personal Access Token
```

**Якщо HTTPS не працює, використовуй SSH:**
```powershell
git remote set-url origin git@github.com:renderlex/renderlex.github.io.git
git push -u origin main
```

---

### **Крок 3: Налаштувати GitHub Pages**
1. Перейди на **https://github.com/renderlex/renderlex.github.io**
2. **Settings** → **Pages** (ліва панель)
3. **Build and deployment:**
   - **Source:** Deploy from a branch
   - **Branch:** `main` / `root` (/)
   - Натисни **Save**

---

### **Крок 4: Перевірка ✓**
Після 2-3 хвилин сайт буде доступний на:
### 🌐 **https://renderlex.github.io**

---

## 🔐 Налаштування GitHub Personal Access Token

Якщо HTTPS push просить token:

1. GitHub → **Settings** → **Developer settings** → **Personal access tokens** → **Tokens (classic)**
2. **Generate new token** → обрай `repo` область
3. Скопіюй токен та використовуй як пароль при push

**Алтернатива:** Налаштуй SSH ключі для більшої безпеки

---

## 📊 Структура, яка буде опублікована

```
renderlex.github.io/
├── index.html              # Основна сторінка
├── data.json               # База 67 речовин  
├── README.md               # Документація
├── fire-load-app/          # Динамічна версія (optional)
└── fire-load-public/       # Статична версія (optional)
```

---

## ✨ Результат

✅ Сайт на `https://renderlex.github.io`
✅ VS Code тема (білий текст, темний фон)
✅ Двомовність (UK/EN)
✅ 67 матеріалів з параметрами
✅ Пошук і фільтрація
✅ 4 кнопки донатів
✅ Посилання на профілі

---

## 📞 Підтримка

Якщо виникли проблеми:
- **Repository not found:** Перевір що репозиторій створений на GitHub
- **Permission denied:** Налаштуй SSH ключі або Personal Access Token
- **404 на сайті:** Перевір GitHub Pages settings (branch = main, folder = root)

---

**Сайт готовий до публікації!** 🚀

