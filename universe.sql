-- Create database
CREATE DATABASE universe;

-- Connect to database
\c universe

-- =========================
-- TABLE: galaxy
-- =========================
CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  galaxy_type TEXT NOT NULL,
  distance_from_earth NUMERIC NOT NULL,
  has_life BOOLEAN NOT NULL,
  is_active BOOLEAN NOT NULL
);

-- =========================
-- TABLE: star
-- =========================
CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
  temperature INT NOT NULL,
  is_spherical BOOLEAN NOT NULL
);

-- =========================
-- TABLE: planet
-- =========================
CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  star_id INT NOT NULL REFERENCES star(star_id),
  radius INT NOT NULL,
  has_life BOOLEAN NOT NULL,
  is_habitable BOOLEAN NOT NULL
);

-- =========================
-- TABLE: moon
-- =========================
CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  planet_id INT NOT NULL REFERENCES planet(planet_id),
  diameter INT NOT NULL,
  is_spherical BOOLEAN NOT NULL,
  has_atmosphere BOOLEAN NOT NULL
);

-- =========================
-- TABLE: satellite (5th table)
-- =========================
CREATE TABLE satellite (
  satellite_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  launch_year INT NOT NULL,
  is_operational BOOLEAN NOT NULL
);

-- =========================
-- INSERT DATA: galaxy (6 rows)
-- =========================
INSERT INTO galaxy (name, galaxy_type, distance_from_earth, has_life, is_active) VALUES
('Milky Way', 'Spiral', 0, true, true),
('Andromeda', 'Spiral', 2537000, false, true),
('Triangulum', 'Spiral', 3000000, false, true),
('Whirlpool', 'Spiral', 23000000, false, false),
('Sombrero', 'Elliptical', 29000000, false, false),
('Black Eye', 'Spiral', 17000000, false, true);

-- =========================
-- INSERT DATA: star (6 rows)
-- =========================
INSERT INTO star (name, galaxy_id, temperature, is_spherical) VALUES
('Sun', 1, 5778, true),
('Proxima Centauri', 1, 3042, true),
('Sirius', 1, 9940, true),
('Alpha Andromedae', 2, 13800, true),
('Beta Trianguli', 3, 8000, true),
('Whirlpool Star', 4, 6000, true);

-- =========================
-- INSERT DATA: planet (12 rows)
-- =========================
INSERT INTO planet (name, star_id, radius, has_life, is_habitable) VALUES
('Mercury', 1, 2440, false, false),
('Venus', 1, 6052, false, false),
('Earth', 1, 6371, true, true),
('Mars', 1, 3390, false, false),
('Jupiter', 1, 69911, false, false),
('Saturn', 1, 58232, false, false),
('Uranus', 1, 25362, false, false),
('Neptune', 1, 24622, false, false),
('Proxima b', 2, 7160, false, true),
('Sirius b1', 3, 5000, false, false),
('Andromeda I', 4, 8000, false, false),
('Triangulum Prime', 5, 9000, false, false);

-- =========================
-- INSERT DATA: moon (20 rows)
-- =========================
INSERT INTO moon (name, planet_id, diameter, is_spherical, has_atmosphere) VALUES
('Moon', 3, 3474, true, false),
('Phobos', 4, 22, false, false),
('Deimos', 4, 12, false, false),
('Io', 5, 3643, true, true),
('Europa', 5, 3122, true, true),
('Ganymede', 5, 5268, true, true),
('Callisto', 5, 4821, true, false),
('Titan', 6, 5150, true, true),
('Rhea', 6, 1528, true, false),
('Iapetus', 6, 1469, true, false),
('Miranda', 7, 471, true, false),
('Ariel', 7, 1158, true, false),
('Umbriel', 7, 1169, true, false),
('Titania', 7, 1578, true, false),
('Oberon', 7, 1523, true, false),
('Triton', 8, 2706, true, true),
('Nereid', 8, 340, false, false),
('Charon', 9, 1212, true, false),
('Styx', 9, 16, false, false),
('Kerberos', 9, 19, false, false);

-- =========================
-- INSERT DATA: satellite (3 rows)
-- =========================
INSERT INTO satellite (name, launch_year, is_operational) VALUES
('Hubble', 1990, true),
('James Webb', 2021, true),
('Voyager 1', 1977, false);
