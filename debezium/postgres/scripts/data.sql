
CREATE TABLE IF NOT EXISTS movies (
    id bigint PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    year INTEGER NOT NULL,
    director VARCHAR(255) NOT NULL,
    rating DECIMAL NOT NULL
);

INSERT INTO movies (id, title, year, director, rating) VALUES (1, 'The Shawshank Redemption', 1994, 'Frank Darabont', 9.3);
INSERT INTO movies (id, title, year, director, rating) VALUES (2, 'The Godfather', 1972, 'Francis Ford Coppola', 9.2);
INSERT INTO movies (id, title, year, director, rating) VALUES (3, 'The Godfather: Part II', 1974, 'Francis Ford Coppola', 9.0);
INSERT INTO movies (id, title, year, director, rating) VALUES (4, 'The Dark Knight', 2008, 'Christopher Nolan', 9.0);
INSERT INTO movies (id, title, year, director, rating) VALUES (5, 'Interstellar', 2014, 'Christopher Nolan', 10);

