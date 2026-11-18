require 'sqlite3'
require_relative '../config'

db = SQLite3::Database.new(DB_PATH)

puts "Använder databasen: #{DB_PATH}"
puts "🧹 Tar bort gamla tabeller..."
db.execute('DROP TABLE IF EXISTS todos')

puts "🧱 Skapar tabeller..."

db.execute('CREATE TABLE categories ( 
  id INTEGER PRIMARY KEY AUTOINCREMENT
  name TEXT NOT NULL
  )')

db.execute('CREATE TABLE todos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL, 
            description TEXT,
            category_id INTEGER,
            completed INTEGER DEFAULT 0 )')

puts "🍎 Fyller på med data..."         
db.execute('INSERT INTO categories (name) VALUES ("privat")')
db.execute('INSERT INTO categories (name) VALUES ("jobb")')
db.execute('INSERT INTO categories (name) VALUES ("köp")')

db.execute('INSERT INTO todos (name, description, category_id, completed) VALUES ("Köp mjölk", "3 lite mellanmjölk, eko", 2, 1)')
db.execute('INSERT INTO todos (name, description, category_id, completed) VALUES ("Köp julgran", "En rödgran", 2, 0)')
db.execute('INSERT INTO todos (name, description, category_id, completed) VALUES ("Pynta gran", "Glöm inte lamporna i granen och tomten", 0, 0)')

puts "✅ Databasen är seedad!"