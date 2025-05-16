package java_web.demo09.model;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.time.LocalDate;
import java.util.List;

public class Movie {
    private int id;

    @NotBlank(message = "Movie name cannot be empty")
    @Size(max = 100, message = "Movie name cannot exceed 100 characters")
    private String name;

    @NotBlank(message = "Director cannot be empty")
    @Size(max = 100, message = "Director name cannot exceed 100 characters")
    private String director;

    @NotBlank(message = "Image URL cannot be empty")
    @Size(max = 512, message = "Image URL cannot exceed 512 characters")
    private String image;

    @NotBlank(message = "Actor list cannot be empty")
    @Size(max = 200, message = "Actor list cannot exceed 200 characters")
    private String actors;

    @NotBlank(message = "Genre cannot be empty")
    @Size(max = 50, message = "Genre cannot exceed 50 characters")
    private String genre;

    @NotBlank(message = "Language cannot be empty")
    @Size(max = 50, message = "Language cannot exceed 50 characters")
    private String language;

    @NotBlank(message = "Duration cannot be empty")
    @Size(max = 10, message = "Duration cannot exceed 10 characters")
    private String duration;

    @NotNull(message = "Release date cannot be null")
    private LocalDate releaseDate;

    @NotBlank(message = "Description cannot be empty")
    @Size(max = 500, message = "Description cannot exceed 500 characters")
    private String description;

    private List<String> showtimes;

    public Movie() {
    }

    public Movie(int id, String name, String director, String image, String actors, String genre,
                 String language, String duration, LocalDate releaseDate, String description, List<String> showtimes) {
        this.id = id;
        this.name = name;
        this.director = director;
        this.image = image;
        this.actors = actors;
        this.genre = genre;
        this.language = language;
        this.duration = duration;
        this.releaseDate = releaseDate;
        this.description = description;
        this.showtimes = showtimes;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getActors() {
        return actors;
    }

    public void setActors(String actors) {
        this.actors = actors;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public LocalDate getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(LocalDate releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<String> getShowtimes() {
        return showtimes;
    }

    public void setShowtimes(List<String> showtimes) {
        this.showtimes = showtimes;
    }
}