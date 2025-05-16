package java_web.demo09.repository.home;

import java_web.demo09.model.Movie;

import java.util.List;

public interface HomeRepository {
    List<Movie> getAllMovies();

    Movie getMovieById(int id);
}
