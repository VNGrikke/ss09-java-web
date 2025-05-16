package java_web.demo09.service.home;

import java_web.demo09.model.Movie;
import java_web.demo09.repository.home.HomeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HomeServiceImp implements HomeService{

    @Autowired
    private HomeRepository homeRepository;

    @Override
    public List<Movie> getAllMovies() {
        return homeRepository.getAllMovies();
    }

    @Override
    public Movie getMovieById(int id) {
        return homeRepository.getAllMovies().stream()
                .filter(movie -> movie.getId() == id)
                .findFirst()
                .orElse(null);
    }

}
