package java_web.demo09.repository.home;

import java_web.demo09.connection.ConnectionDB;
import java_web.demo09.model.Movie;
import org.springframework.stereotype.Controller;

import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.logging.Logger;

@Controller
public class HomeRepositoryImp implements HomeRepository {
    private static final Logger LOGGER = Logger.getLogger(HomeRepositoryImp.class.getName());

    @Override
    public List<Movie> getAllMovies() {
        Connection conn = null;
        CallableStatement callSt = null;
        ResultSet rs = null;
        List<Movie> movies = new ArrayList<>();

        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call getAllMovies()}");
            rs = callSt.executeQuery();

            while (rs.next()) {
                Movie movie = new Movie();
                movie.setId(rs.getInt("id"));
                movie.setName(rs.getString("name"));
                movie.setDirector(rs.getString("director"));
                movie.setImage(rs.getString("image"));
                movie.setActors(rs.getString("actors"));
                movie.setGenre(rs.getString("genre"));
                movie.setLanguage(rs.getString("language"));
                movie.setDuration(rs.getString("duration"));
                movie.setReleaseDate(rs.getDate("release_date") != null
                        ? rs.getDate("release_date").toLocalDate()
                        : null);
                movie.setDescription(rs.getString("description"));

                // Handle showtimes
                String showtimesStr = rs.getString("showtimes");
                if (showtimesStr != null && !showtimesStr.isEmpty()) {
                    List<String> showtimes = Arrays.asList(showtimesStr.split(", "));
                    movie.setShowtimes(showtimes);
                } else {
                    movie.setShowtimes(Collections.emptyList());
                }

                movies.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return movies;
    }

    @Override
    public Movie getMovieById(int id) {
        Connection conn = null;
        CallableStatement callSt = null;
        ResultSet rs = null;
        Movie movie = null;
        try {
            conn = ConnectionDB.openConnection();
            callSt = conn.prepareCall("{call getMovieById(?)}");
            callSt.setInt(1, id);
            rs = callSt.executeQuery();

            if (rs.next()) {
                movie = new Movie();
                movie.setId(rs.getInt("id"));
                movie.setName(rs.getString("name"));
                movie.setDirector(rs.getString("director"));
                movie.setImage(rs.getString("image"));
                movie.setActors(rs.getString("actors"));
                movie.setGenre(rs.getString("genre"));
                movie.setLanguage(rs.getString("language"));
                movie.setDuration(rs.getString("duration"));
                movie.setReleaseDate(rs.getDate("release_date") != null
                        ? rs.getDate("release_date").toLocalDate()
                        : null);
                movie.setDescription(rs.getString("description"));

                // Handle showtimes
                String showtimesStr = rs.getString("showtimes");
                if (showtimesStr != null && !showtimesStr.isEmpty()) {
                    List<String> showtimes = Arrays.asList(showtimesStr.split(", "));
                    movie.setShowtimes(showtimes);
                } else {
                    movie.setShowtimes(Collections.emptyList());
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.closeConnection(conn, callSt);
        }
        return movie;
    }

}