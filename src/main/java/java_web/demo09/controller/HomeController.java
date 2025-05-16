package java_web.demo09.controller;

import java_web.demo09.model.Movie;
import java_web.demo09.repository.home.HomeRepositoryImp;
import java_web.demo09.service.home.HomeServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/home")
public class HomeController {

    @Autowired
    private HomeServiceImp homeServiceImp;

    @GetMapping
    public String home(Model model) {
        List<Movie> movies = homeServiceImp.getAllMovies();
        model.addAttribute("movies", movies);
        return "home";
    }

    @GetMapping("/movie-detail")
    public String movieDetail(@RequestParam("id") int id, Model model) {
        Movie movie = homeServiceImp.getMovieById(id);
        if (movie != null) {
            model.addAttribute("movie", movie);
        } else {
            model.addAttribute("error", "Movie not found");
        }
        return "detailMovie";
    }

}
