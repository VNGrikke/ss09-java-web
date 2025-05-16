create database ss09;

use ss09;

create table customers(
    id       int auto_increment primary key,
    name     varchar(50),
    phone    varchar(10) unique,
    address  varchar(255),
    email    varchar(100) unique,
    gender   enum ('MALE', 'FEMALE', 'OTHER'),
    password varchar(100)
);

CREATE TABLE movies (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        name VARCHAR(100) NOT NULL,
                        director VARCHAR(100) NOT NULL,
                        image VARCHAR(512) NOT NULL,
                        actors VARCHAR(200) NOT NULL,
                        genre VARCHAR(50) NOT NULL,
                        language VARCHAR(50) NOT NULL,
                        duration VARCHAR(10) NOT NULL,
                        release_date DATE NOT NULL,
                        description TEXT NOT NULL,
                        CONSTRAINT chk_name CHECK (name <> ''),
                        CONSTRAINT chk_director CHECK (director <> ''),
                        CONSTRAINT chk_image CHECK (image <> ''),
                        CONSTRAINT chk_actors CHECK (actors <> ''),
                        CONSTRAINT chk_genre CHECK (genre <> ''),
                        CONSTRAINT chk_language CHECK (language <> ''),
                        CONSTRAINT chk_duration CHECK (duration <> ''),
                        CONSTRAINT chk_description CHECK (description <> '')
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE showtimes (
                           id INT AUTO_INCREMENT PRIMARY KEY,
                           movie_id INT NOT NULL,
                           showtime TIME NOT NULL,
                           show_date DATE NOT NULL,
                           FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE,
                           CONSTRAINT chk_showtime CHECK (showtime IS NOT NULL)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

INSERT INTO customers (name, phone, address, email, gender, password)
VALUES ('John Doe', '1234567890', '123 Main St', 'john@email.com', 'MALE', 'pass123'),
       ('Jane Smith', '2345678901', '456 Oak Ave', 'jane@email.com', 'FEMALE', 'pass456'),
       ('Bob Wilson', '3456789012', '789 Pine Rd', 'bob@email.com', 'MALE', 'pass789'),
       ('Mary Johnson', '4567890123', '321 Elm St', 'mary@email.com', 'FEMALE', 'pass321'),
       ('Sam Brown', '5678901234', '654 Maple Dr', 'sam@email.com', 'OTHER', 'pass654'),
       ('Alice Green', '6789012345', '987 Cedar Ln', 'alice@email.com', 'FEMALE', 'pass987'),
       ('Tom White', '7890123456', '147 Birch Ave', 'tom@email.com', 'MALE', 'pass147'),
       ('Sarah Black', '8901234567', '258 Spruce St', 'sarah@email.com', 'FEMALE', 'pass258'),
       ('Mike Gray', '9012345678', '369 Ash Rd', 'mike@email.com', 'MALE', 'pass369'),
       ('Emma Davis', '0123456789', '741 Pine Ct', 'emma@email.com', 'FEMALE', 'pass741');


INSERT INTO movies (name, director, image, actors, genre, language, duration, release_date, description)
VALUES
    ('Avengers: Endgame', 'Anthony Russo, Joe Russo', 'https://m.media-amazon.com/images/I/91-UCbbhoiL._AC_SL1500_.jpg', 'Robert Downey Jr., Chris Evans, Scarlett Johansson', 'Action, Adventure', 'English', '3h 1m', '2019-04-26', 'Cú kết hoành tráng của Infinity Saga, nơi các siêu anh hùng đối mặt với Thanos.'),
    ('Cô Gái Đan Mạch', 'Tom Hooper', 'https://upload.wikimedia.org/wikipedia/vi/f/f2/The_Danish_Girl_%28film%29_poster.jpg?20210321195657', 'Eddie Redmayne, Alicia Vikander', 'Drama, Biography', 'English', '2h', '2015-11-27', 'Câu chuyện cảm động về hành trình chuyển giới của Lili Elbe.'),
    ('Ký Sinh Trùng', 'Bong Joon-ho', 'https://upload.wikimedia.org/wikipedia/vi/c/cc/Poster_phim_Parasite_2019.jpg', 'Song Kang-ho, Lee Sun-kyun, Cho Yeo-jeong', 'Drama, Thriller', 'Korean', '2h 12m', '2019-05-30', 'Một câu chuyện sâu sắc về bất bình đẳng xã hội và sự đấu tranh.'),
    ('Your Name', 'Makoto Shinkai', 'https://photo.znews.vn/w1920/Uploaded/xbhunku/2016_10_07/hmjo9xzagbxbxkigxo1v.jpg', 'Ryunosuke Kamiki, Mone Kamishiraishi', 'Animation, Romance', 'Japanese', '1h 46m', '2016-08-26', 'Hai thiếu niên hoán đổi cơ thể và khám phá định mệnh của họ.'),
    ('The Dark Knight', 'Christopher Nolan', 'https://upload.wikimedia.org/wikipedia/vi/2/2d/Poster_phim_K%E1%BB%B5_s%C4%A9_b%C3%B3ng_%C4%91%C3%AAm_2008.jpg', 'Christian Bale, Heath Ledger', 'Action, Crime', 'English', '2h 32m', '2008-07-18', 'Batman đối đầu với Joker trong một trận chiến nghẹt thở.'),
    ('Nhà Bà Nữ', 'Trấn Thành', 'https://upload.wikimedia.org/wikipedia/vi/6/6f/%C3%81p_ph%C3%ADch_phim_Nh%C3%A0_b%C3%A0_N%E1%BB%AF.jpg', 'Trấn Thành, Lê Giang, Uyển Ân', 'Drama, Family', 'Vietnamese', '2h 5m', '2023-01-22', 'Câu chuyện cảm động về tình cảm gia đình và sự hy sinh.'),
    ('Inception', 'Christopher Nolan', 'https://upload.wikimedia.org/wikipedia/vi/1/11/Inception_poster_1.jpg', 'Leonardo DiCaprio, Joseph Gordon-Levitt', 'Sci-Fi, Thriller', 'English', '2h 28m', '2010-07-16', 'Một tên trộm xâm nhập vào giấc mơ để đánh cắp bí mật.'),
    ('Spirited Away', 'Hayao Miyazaki', 'https://upload.wikimedia.org/wikipedia/en/d/db/Spirited_Away_Japanese_poster.png', 'Rumi Hiiragi, Miyu Irino', 'Animation, Adventure', 'Japanese', '2h 5m', '2001-07-20', 'Hành trình kỳ diệu của Chihiro trong thế giới linh hồn.'),
    ('Mắt Biếc', 'Victor Vũ', 'https://upload.wikimedia.org/wikipedia/vi/4/42/%C3%81p_ph%C3%ADch_phim_M%E1%BA%AFt_bi%E1%BA%BFc.jpg', 'Trần Nghĩa, Trúc Anh', 'Romance, Drama', 'Vietnamese', '1h 57m', '2019-12-20', 'Câu chuyện tình yêu đầy cảm xúc dựa trên tiểu thuyết của Nguyễn Nhật Ánh.');


INSERT INTO showtimes (movie_id, showtime, show_date)
VALUES
    -- Avengers: Endgame (movie_id = 1)
    (1, '12:30:00', '2025-05-16'),
    (1, '15:45:00', '2025-05-16'),
    (1, '19:00:00', '2025-05-16'),
    -- Cô Gái Đan Mạch (movie_id = 2)
    (2, '11:00:00', '2025-05-16'),
    (2, '14:15:00', '2025-05-16'),
    (2, '17:30:00', '2025-05-16'),
    -- Ký Sinh Trùng (movie_id = 3)
    (3, '13:00:00', '2025-05-16'),
    (3, '16:30:00', '2025-05-16'),
    (3, '20:00:00', '2025-05-16'),
    -- Your Name (movie_id = 4)
    (4, '10:45:00', '2025-05-16'),
    (4, '13:30:00', '2025-05-16'),
    (4, '16:45:00', '2025-05-16'),
    -- The Dark Knight (movie_id = 5)
    (5, '11:30:00', '2025-05-16'),
    (5, '14:45:00', '2025-05-16'),
    (5, '18:15:00', '2025-05-16'),
    -- Nhà Bà Nữ (movie_id = 6)
    (6, '13:15:00', '2025-05-16'),
    (6, '16:00:00', '2025-05-16'),
    (6, '19:30:00', '2025-05-16'),
    -- Inception (movie_id = 7)
    (7, '10:30:00', '2025-05-16'),
    (7, '13:45:00', '2025-05-16'),
    (7, '17:00:00', '2025-05-16'),
    -- Spirited Away (movie_id = 8)
    (8, '12:45:00', '2025-05-16'),
    (8, '15:30:00', '2025-05-16'),
    (8, '18:45:00', '2025-05-16'),
    -- Mắt Biếc (movie_id = 9)
    (9, '11:15:00', '2025-05-16'),
    (9, '14:00:00', '2025-05-16'),
    (9, '17:15:00', '2025-05-16');


delimiter &&
create procedure login(
    in_email varchar(100),
    in_password varchar(100)
)
begin
    select *
    from customers c
    where c.email = in_email
      and c.password = in_password;
end &&
delimiter ;


DELIMITER &&
CREATE PROCEDURE getAllMovies()
BEGIN
    SELECT
        m.id,
        m.name,
        m.director,
        m.image,
        m.actors,
        m.genre,
        m.language,
        m.duration,
        m.release_date,
        m.description,
        GROUP_CONCAT(
                TIME_FORMAT(s.showtime, '%h:%i %p')
                ORDER BY s.showtime
                SEPARATOR ', '
        ) AS showtimes
    FROM movies m
             LEFT JOIN showtimes s ON m.id = s.movie_id
        AND s.show_date = CURDATE()
    GROUP BY m.id, m.name, m.director, m.image, m.actors, m.genre, m.language, m.duration, m.release_date, m.description
    ORDER BY m.name;
END &&
DELIMITER ;


DELIMITER &&
CREATE PROCEDURE getMovieById(IN movieId INT)
BEGIN
    SELECT
        m.id,
        m.name,
        m.director,
        m.image,
        m.actors,
        m.genre,
        m.language,
        m.duration,
        m.release_date,
        m.description,
        GROUP_CONCAT(
                TIME_FORMAT(s.showtime, '%h:%i %p')
                ORDER BY s.showtime
                SEPARATOR ', '
        ) AS showtimes
    FROM movies m
             LEFT JOIN showtimes s ON m.id = s.movie_id
        AND s.show_date = CURDATE()
    WHERE m.id = movieId
    GROUP BY m.id, m.name, m.director, m.image, m.actors, m.genre, m.language, m.duration, m.release_date, m.description;
END &&
DELIMITER ;