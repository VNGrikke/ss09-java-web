<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Movie Details - VNG Cinema</title>
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
            max-width: 1000px;
            margin: 0 auto;
            padding: 30px;
        }

        h1 {
            font-size: 2.5rem;
            color: #f5c518;
            text-align: center;
            margin-bottom: 30px;
            text-shadow: 0 0 10px rgba(245, 197, 24, 0.5);
        }

        .movie-detail {
            background: #222;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
            display: flex;
            gap: 20px;
        }

        .movie-poster {
            width: 300px;
            height: auto;
            border-radius: 8px;
        }

        .movie-info {
            flex: 1;
        }

        .movie-title {
            font-size: 1.8rem;
            font-weight: 600;
            color: #f5c518;
            margin-bottom: 10px;
        }

        .movie-genre, .movie-director, .movie-actors, .movie-language, .movie-duration, .movie-release-date {
            font-size: 1rem;
            color: #cccccc;
            margin-bottom: 8px;
        }

        .movie-description {
            font-size: 1rem;
            color: #b3b3b3;
            margin-bottom: 15px;
        }

        .showtimes {
            font-size: 0.95rem;
            color: #b3b3b3;
            margin-bottom: 15px;
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
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: 600;
            font-size: 1rem;
            transition: background 0.3s ease;
        }

        .book-now:hover {
            background: #e0b015;
        }

        .error-message {
            text-align: center;
            font-size: 1.2rem;
            color: #ff5555;
            margin-top: 20px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .movie-detail {
                flex-direction: column;
                align-items: center;
            }

            .movie-poster {
                width: 100%;
                max-width: 300px;
            }

            h1 {
                font-size: 2rem;
            }

            .movie-title {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Movie Details</h1>
    <c:choose>
        <c:when test="${not empty movie}">
            <div class="movie-detail">
                <img src="${movie.image}" alt="${movie.name}" class="movie-poster">
                <div class="movie-info">
                    <div class="movie-title">${movie.name}</div>
                    <div class="movie-genre">Genre: ${movie.genre}</div>
                    <div class="movie-director">Director: ${movie.director}</div>
                    <div class="movie-actors">Actors: ${movie.actors}</div>
                    <div class="movie-language">Language: ${movie.language}</div>
                    <div class="movie-duration">Duration: ${movie.duration}</div>
                    <div class="movie-release-date">Release Date: ${movie.releaseDate}</div>
                    <div class="movie-description">${movie.description}</div>
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
                    <a href="#" class="book-now">Book Tickets</a>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="error-message">${error}</div>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>