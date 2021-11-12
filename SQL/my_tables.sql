DROP TABLE countries;
DROP TABLE animals;

CREATE TABLE countries(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  population INTEGER NOT NULL
);

CREATE TABLE animals(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  country_id INTEGER NOT NULL,

  FOREIGN KEY (country_id) REFERENCES countries(id)
);

INSERT INTO countries (name, population)
VALUES ('Indonesia', 240000000)
;

INSERT INTO animals (name, country_id)
VALUES
('Raccon', (SELECT id FROM countries where name = 'Indonesia')),
('Black Bear', (SELECT id FROM countries WHERE name = 'Indonesia')),
('Rhino', (SELECT id FROM countries WHERE name = 'Indonesia'))
;