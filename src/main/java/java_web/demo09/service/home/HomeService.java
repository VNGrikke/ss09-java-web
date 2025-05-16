package java_web.demo09.service.home;

import java_web.demo09.model.Movie;

import java.util.List;

public interface HomeService {
    List<Movie> getAllMovies();

    Movie getMovieById(int id);
}
