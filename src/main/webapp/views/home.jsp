<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Now Showing - Movie Theater</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #1a1a1a 0%, #2c003e 100%);
            color: #ffffff;
            line-height: 1.6;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 30px;
        }

        h1 {
            text-align: center;
            font-size: 2.5rem;
            margin: 30px 0;
            text-transform: uppercase;
            letter-spacing: 2px;
            color: #f5c518;
            text-shadow: 0 0 10px rgba(245, 197, 24, 0.5);
        }

        .movie-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 25px;
            padding: 20px 0;
        }

        .movie-card {
            background: #222;
            border-radius: 12px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
        }

        .movie-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 25px rgba(245, 197, 24, 0.3);
        }

        .movie-poster {
            width: 100%;
            height: 350px;
            object-fit: cover;
            display: block;
        }

        .movie-info {
            padding: 15px;
        }

        .movie-title {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 8px;
            color: #f5c518;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
        }

        .movie-genre {
            font-size: 0.9rem;
            color: #cccccc;
            margin-bottom: 10px;
        }

        .showtimes {
            font-size: 0.85rem;
            color: #b3b3b3;
            margin-bottom: 12px;
        }

        .showtimes span {
            background: #f5c518;
            color: #1a1a1a;
            padding: 4px 8px;
            border-radius: 4px;
            margin-right: 5px;
            font-weight: 500;
        }

        .book-now {
            display: inline-block;
            background: #f5c518;
            color: #1a1a1a;
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 5px;
            font-weight: 600;
            font-size: 0.9rem;
            transition: background 0.3s ease;
            text-align: center;
            width: 100%;
        }

        .book-now:hover {
            background: #e0b015;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .movie-grid {
                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
                gap: 15px;
            }

            .movie-poster {
                height: 300px;
            }

            h1 {
                font-size: 2rem;
            }

            .movie-title {
                font-size: 1.1rem;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 15px;
            }

            .movie-grid {
                grid-template-columns: 1fr;
            }

            .movie-poster {
                height: 280px;
            }

            h1 {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1>WELCOME TO VNG CINEMA</h1>
    <div class="movie-grid">
        <c:forEach var="movie" items="${movies}">
            <div class="movie-card">
                <img src="${movie.image}" alt="${movie.name}" class="movie-poster">
                <div class="movie-info">
                    <div class="movie-title">${movie.name}</div>
                    <div class="movie-genre">${movie.genre}</div>
                    <div class="showtimes">
                        <c:choose>
                            <c:when test="${empty movie.showtimes}">
                                <span>No showtimes available</span>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="showtime" items="${movie.showtimes}">
                                    <span>${showtime}</span>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <a href="/home/movie-detail?id=${movie.id}" class="book-now">Book Now</a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>