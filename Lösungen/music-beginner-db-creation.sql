-- Create database and use it
DROP DATABASE IF EXISTS music_beginner;
CREATE DATABASE music_beginner;

USE music_beginner;

-- Table creation
CREATE TABLE artists (
    id INT AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(255) NOT NULL,
    country VARCHAR(100),
    birthdate DATE,
    debut_year YEAR
);

CREATE TABLE songs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    song_name VARCHAR(255) NOT NULL,
    duration INT,
    artist_id INT,
    genre VARCHAR(100),
    release_year YEAR,
    writer VARCHAR(255),
    lyrics TEXT,
    FOREIGN KEY (artist_id) REFERENCES artists(id)
);

CREATE TABLE ratings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    song_id INT NOT NULL,
    username VARCHAR(255),
    rating DECIMAL(3, 1),
    review TEXT,
    FOREIGN KEY (song_id) REFERENCES songs(id)
);

-- Data insertion
INSERT INTO artists (artist_name, country, birthdate, debut_year) VALUES
('Elton John', 'UK', '1947-03-25', 1969),
('Madonna', 'USA', '1958-08-16', 1982),
('The Beatles', 'UK', NULL, 1960),
('Adele', 'UK', '1988-05-05', 2008),
('David Bowie', 'UK', '1947-01-08', 1964),
('Bob Dylan', 'USA', '1941-05-24', 1962),
('Beyoncé', 'USA', '1981-09-04', 1997),
('Taylor Swift', 'USA', '1989-12-13', 2006),
('Billie Eilish', 'USA', '2001-12-18', 2016);


-- Example IDs: Elton John (1), Madonna (2), The Beatles (3), Adele (4), David Bowie (5), Bob Dylan (6), Beyoncé (7), Taylor Swift (8)
INSERT INTO songs (song_name, duration, artist_id, genre, release_year, writer, lyrics) VALUES
('Your Song', 240, 1, 'Pop', 1970, 'Elton John', 'It\'s a little bit funny, this feeling inside... (Lyrics for educational use only)'),
('Rocket Man', 270, 1, 'Pop', 1972, 'Elton John', 'And I think it\'s gonna be a long, long time... (Lyrics for educational use only)'),
('Tiny Dancer', 360, 1, 'Pop', 1971, 'Elton John', 'Blue jean baby, L.A. lady, seamstress for the band... (Lyrics for educational use only)'),

('Like a Prayer', 330, 2, 'Pop', 1989, 'Madonna', 'Life is a mystery, everyone must stand alone... (Lyrics for educational use only)'),
('Vogue', 300, 2, 'Pop', 1990, 'Madonna', 'Look around, everywhere you turn is heartache... (Lyrics for educational use only)'),

('Hey Jude', 431, 3, 'Rock', 1968, 'Paul McCartney', 'Hey Jude, don\'t make it bad, take a sad song and make it better... (Lyrics for educational use only)'),
('Let It Be', 240, 3, 'Rock', 1970, 'Paul McCartney', 'When I find myself in times of trouble, Mother Mary comes to me... (Lyrics for educational use only)'),

('Hello', 295, 4, 'Pop', 2015, 'Adele', 'Hello, it\'s me, I was wondering if after all these years you\'d like to meet... (Lyrics for educational use only)'),
('Someone Like You', 285, 4, 'Pop', 2011, 'Adele', 'I heard that you\'re settled down, that you found a girl and you\'re married now... (Lyrics for educational use only)'),

('Space Oddity', 315, 5, 'Rock', 1969, 'David Bowie', 'Ground Control to Major Tom, Ground Control to Major Tom... (Lyrics for educational use only)'),
('Heroes', 355, 5, 'Rock', 1977, 'David Bowie', 'I, I will be king, and you, you will be queen... (Lyrics for educational use only)'),

('Like a Rolling Stone', 360, 6, 'Rock', 1965, 'Bob Dylan', 'Once upon a time you dressed so fine, threw the bums a dime in your prime, didn\'t you?... (Lyrics for educational use only)'),
('Blowin’ in the Wind', 210, 6, 'Folk', 1963, 'Bob Dylan', 'How many roads must a man walk down, before you call him a man?... (Lyrics for educational use only)'),

('Halo', 270, 7, 'Pop', 2008, 'Beyoncé', 'Remember those walls I built? Well, baby, they\'re tumbling down... (Lyrics for educational use only)'),
('Single Ladies', 200, 7, 'Pop', 2008, 'Beyoncé', 'All the single ladies, put your hands up... (Lyrics for educational use only)'),

('Shake It Off', 220, 8, 'Pop', 2014, 'Taylor Swift', 'I stay out too late, got nothing in my brain, that\'s what people say... (Lyrics for educational use only)'),
('Blank Space', 230, 8, 'Pop', 2014, 'Taylor Swift', 'Nice to meet you, where you been? I could show you incredible things... (Lyrics for educational use only)'),

('Therefore I Am', 174, 9, 'Alternative', 2020, 'Billie Eilish', 'I\'m not your friend or anything, damn... (Lyrics for educational use only)'),
('Your Power', 245, 9, 'Indie Pop', 2021, 'Billie Eilish', 'Try not to abuse your power... (Lyrics for educational use only)'),
('Happier Than Ever', 298, 9, 'Alternative', 2021, 'Billie Eilish', 'When I\'m away from you, I\'m happier than ever... (Lyrics for educational use only)'),

('Imagine', 183, 3, 'Rock', 1971, 'John Lennon', 'Imagine all the people living life in peace... (Lyrics for educational use only)'),
('Come Together', 259, 3, 'Rock', 1969, 'John Lennon', 'Here come old flat-top, he come grooving up slowly... (Lyrics for educational use only)'),

('Candle in the Wind', 216, 1, 'Pop', 1973, 'Bernie Taupin', 'Goodbye Norma Jean, though I never knew you at all... (Lyrics for educational use only)'),

('La Isla Bonita', 240, 2, 'Pop', 1986, 'Patrick Leonard', 'Last night I dreamt of San Pedro... (Lyrics for educational use only)');


-- Assuming song IDs sequentially from 1 to 17
INSERT INTO ratings (song_id, rating, review, username) VALUES
(1, 9.5, 'A timeless classic with emotionally resonant lyrics and a captivating melody.', 'musicFan123'),
(2, 9.3, 'An iconic track, brilliantly showcasing the artist’s vocal range and emotional depth.', 'songLover89'),
(3, 8.9, 'A soulful ballad, filled with poignant lyrics and a melody that stays with you long after the song ends.', 'melodyCritic'),

(4, 9.4, 'A groundbreaking pop anthem, blending powerful vocals with a catchy and vibrant rhythm.', 'beatEnthusiast'),
(5, 9.1, 'A dynamic and stylish song, characterized by its innovative sound and profound lyrics.', 'rhythmRover'),

(6, 9.7, 'A masterpiece of lyrical genius, with a compelling melody that has stood the test of time.', 'classicFan'),
(7, 9.0, 'An emotionally charged song, combining soulful lyrics with a memorable and iconic tune.', 'musicFan123'),

(8, 9.6, 'A hauntingly beautiful song, showcasing deep and resonant vocals paired with heartfelt lyrics.', 'deepListener'),
(9, 9.2, 'A powerful and emotional ballad, marked by its poignant lyrics and a deeply moving melody.', 'lyricLover'),

(10, 9.8, 'A truly iconic and groundbreaking track, blending unique soundscapes with deeply poetic lyrics.', 'musicAficionado'),
(11, 9.3, 'An inspirational song, featuring an uplifting melody and lyrics that resonate with hope and courage.', 'beatEnthusiast'),

(12, 9.5, 'A revolutionary song, with thought-provoking lyrics and a melody that has influenced generations.', 'historyBuff'),
(13, 9.1, 'A folk anthem, combining simple yet profound lyrics with a melody that echoes the spirit of an era.', 'songLover89'),

(14, 9.4, 'A beautifully crafted song, combining powerful vocals with a melody that is both catchy and soulful.', 'deepListener'),
(15, 9.2, 'An energetic and empowering track, marked by its vibrant rhythm and inspiring lyrics.', 'rhythmRover'),

(16, 9.6, 'A pop culture phenomenon, with catchy lyrics and a rhythm that’s impossible to forget.', 'popFanatic'),
(17, 9.3, 'A charming and witty song, featuring clever lyrics and a melody that’s both catchy and memorable.', 'lyricLover'),

(18, 8.7, 'A bold and edgy track that showcases Eilish\'s unique style and lyrical prowess.', 'lyricLover'),
(19, 9.1, 'A powerful and emotive song, highlighting Eilish\'s vocal range and depth.', 'deepListener'),
(20, 9.3, 'An introspective and beautifully crafted track, demonstrating her artistic growth.', 'popFanatic'),
(18, 5.5, 'Lacks the depth and musical complexity I usually enjoy. Not my cup of tea.', 'classicFan'),
(19, 4.0, 'Too modern for my taste, misses the classic touch of musicality.', 'classicFan'),
(20, 6.3, 'It\'s trendy, but lacks the timeless quality of the classics.', 'classicFan'),

(1, 9.2, 'An evergreen classic that still feels fresh.', 'harmonySeeker'),
(1, 8.9, 'Elton John’s timeless melody and heartfelt lyrics.', 'indieExplorer'),
(2, 9.0, 'A defining song of its era, brilliantly composed.', 'rockRevolution'),
(3, 9.4, 'A soul-stirring track that showcases Elton John\'s depth.', 'electroEagle'),

(4, 8.8, 'Madonna’s iconic style shines through this track.', 'electroEagle'),
(4, 9.1, 'A song that pushed the boundaries of its time.', 'indieExplorer'),
(5, 9.0, 'A rhythmically captivating and lyrically profound song.', 'folkFollower'),

(6, 9.6, 'An absolute classic, defining the spirit of an era.', 'folkFollower'),
(6, 9.3, 'The Beatles at their best, timeless and universal.', 'rockRevolution'),
(7, 9.2, 'A beautiful, haunting melody that stays with you.', 'electroEagle'),

(8, 9.5, 'Adele’s voice is incredibly moving in this powerful ballad.', 'rockRevolution'),
(9, 9.1, 'Emotionally charged and beautifully performed.', 'harmonySeeker'),

(10, 9.3, 'David Bowie’s unique sound captured perfectly.', 'harmonySeeker'),
(11, 9.2, 'A song that combines poetic lyrics with an unforgettable melody.', 'indieExplorer'),

(12, 9.4, 'Bob Dylan’s lyrical genius shines in this iconic track.', 'lyricLover'),
(13, 9.0, 'A song that speaks to generations, profound and moving.', 'folkFollower'),

(14, 9.1, 'Beyoncé’s vocal range and emotional depth are stunning here.', 'rockRevolution'),
(15, 9.0, 'An empowering anthem that’s both catchy and meaningful.', 'popFanatic'),

(16, 9.2, 'Taylor Swift’s catchy tune that’s impossible to forget.', 'user24'),
(17, 9.3, 'A clever and witty song, showcasing Swift’s lyrical talent.', 'lyricLover'),

(18, 8.7, 'A bold and edgy track that showcases Eilish\'s unique style and lyrical prowess.', 'electroEagle'),
(18, 8.5, 'Captivating beats and haunting lyrics, a true testament to her talent.', 'indieExplorer'),
(19, 9.1, 'A powerful and emotive song, highlighting Eilish\'s vocal range and depth.', 'indieExplorer'),
(19, 8.9, 'Incredibly moving and beautifully sung, a real gem.', 'electroEagle'),
(20, 9.3, 'An introspective and beautifully crafted track, demonstrating her artistic growth.', 'harmonySeeker'),
(20, 9.0, 'Eilish at her best, combining emotional depth with superb musicality.', 'indieExplorer'),
(20, 9.2, 'A deeply personal song that resonates with listeners, both poignant and powerful.', 'electroEagle'),

(2, 3.8, 'The lyrics are too basic for me, lacks depth and nuance.', 'lyricLover'),
(5, 3.5, 'Simple lyrics that don\'t really provoke much thought or emotion.', 'lyricLover'),
(15, 3.9, 'Expected more complex lyrics, this was a bit too straightforward.', 'lyricLover');



