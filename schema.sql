-- Datenbankschema für die Rezeptdatenbank
CREATE DATABASE IF NOT EXISTS rezeptdatenbank CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE rezeptdatenbank;

CREATE TABLE IF NOT EXISTS categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS recipes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    category_id INT DEFAULT NULL,
    ingredients TEXT NOT NULL,
    instructions TEXT NOT NULL,
    prep_time_minutes INT DEFAULT NULL,
    image_url VARCHAR(255) DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL
);

INSERT INTO categories (name) VALUES
    ('Frühstück'), ('Hauptgericht'), ('Dessert'), ('Vorspeise'), ('Getränk')
ON DUPLICATE KEY UPDATE name = name;

INSERT INTO recipes (title, category_id, ingredients, instructions, prep_time_minutes) VALUES
    ('Pancakes', 1, '200g Mehl\n2 Eier\n300ml Milch\n1 TL Backpulver\n1 Prise Salz', 'Alle Zutaten zu einem glatten Teig verrühren. Portionsweise in einer Pfanne bei mittlerer Hitze goldbraun backen.', 20),
    ('Spaghetti Carbonara', 2, '400g Spaghetti\n150g Speck\n3 Eier\n80g Parmesan\nPfeffer', 'Speck anbraten. Spaghetti kochen, mit Speck vermengen, vom Herd nehmen, Eier-Parmesan-Mischung unterrühren.', 25),
    ('Schokoladenmousse', 3, '200g dunkle Schokolade\n4 Eier\n50g Zucker\n200ml Sahne', 'Schokolade schmelzen, Eigelb unterrühren. Eiweiß und Sahne getrennt steif schlagen, unterheben, kaltstellen.', 30),
    ('Bruschetta', 4, '1 Baguette\n4 Tomaten\n2 Knoblauchzehen\nOlivenöl\nBasilikum', 'Baguette toasten. Tomaten würfeln, mit Knoblauch, Öl und Basilikum mischen, auf Baguette geben.', 15),
    ('Zitronenlimonade', 5, '4 Zitronen\n100g Zucker\n1L Wasser\nEiswürfel', 'Zitronen auspressen, mit Zucker und Wasser vermengen, kaltstellen und mit Eiswürfeln servieren.', 10)
ON DUPLICATE KEY UPDATE title = title;
