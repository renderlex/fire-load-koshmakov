const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const path = require('path');
const cors = require('cors');

const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());
app.use(express.static(path.join(__dirname, '../frontend')));

const dbPath = path.join(__dirname, 'fire_loads.db');
const db = new sqlite3.Database(dbPath);

// API для отримання всіх даних або пошуку
app.get('/api/fire-loads', (req, res) => {
  const search = req.query.search || '';
  const query = `SELECT * FROM fire_loads WHERE name LIKE ?`;
  
  db.all(query, [`%${search}%`], (err, rows) => {
    if (err) {
      res.status(500).json({ error: err.message });
      return;
    }
    res.json(rows);
  });
});

app.listen(port, () => {
  console.log(`Сервер запущено на http://localhost:${port}`);
});
