@echo off
REM ============================================
REM Fire Load Database - Локальний запуск
REM ============================================
REM Сайт: База даних пожежних навантажень
REM Опис: На основі Кошмарова, на Express.js + SQLite3
REM Порт: 3000
REM Фронтенд: http://localhost:3000
REM ============================================

cd /d "%~dp0fire-load-app"

echo.
echo [FIRE-LOAD] Встановлення залежностей...
call npm install

echo.
echo [FIRE-LOAD] Ініціалізація бази даних...
call npm run seed

echo.
echo [FIRE-LOAD] Запуск сервера на порту 3000...
echo [FIRE-LOAD] Перейдіть на http://localhost:3000 у браузер
echo.
call npm start

pause
