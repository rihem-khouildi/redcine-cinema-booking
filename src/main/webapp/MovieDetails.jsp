<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.enit.entities.Film" %>
<%@ page import="com.enit.entities.Seance" %>
<%@ page import="java.util.List" %>

<%
    // Retrieve the movie object from the request attribute
    Film movie = (Film) request.getAttribute("movie");
    List<Seance> Sessions = (List<Seance>) request.getAttribute("sessions");

    // Redirect to the servlet if `movie` attribute is missing
    if (movie == null) {
        response.sendRedirect("movieDetails");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            
            background-size: cover;
            color: #fff;
            line-height: 1.8;
        }
        #background-video {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
  z-index: -1; /* Make sure the video is in the background */
}
        

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: rgba(0, 0, 0, 0,1); /* Noir avec 10% d'opacité */
            padding: 15px 20px;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(10px); /* Ajoute un effet de flou */
        }

        .navbar .logo {
            font-size: 24px;
            font-weight: bold;
            color: #e50914;
            cursor: pointer;
        }

        .navbar .menu {
            display: flex;
            gap: 30px;
        }

        .navbar .menu a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            position: relative;
            transition: color 0.3s ease;
        }

        .navbar .menu a::after {
            content: '';
            display: block;
            width: 0;
            height: 2px;
            background: #e50914;
            transition: width 0.3s;
            position: absolute;
            bottom: -5px;
            left: 0;
        }

        .navbar .menu a:hover {
            color: #e50914;
        }

        .navbar .menu a:hover::after {
            width: 100%;
        }

        .navbar .auth-buttons {
            display: flex;
            gap: 15px;
        }

        .navbar .auth-buttons a {
            padding: 8px 20px;
            background-color: #e50914;
            color: white;
            border-radius: 25px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .navbar .auth-buttons a:hover {
            background-color: #d40813;
        }

       .movie-background {
    /* Couleur de fond sombre */
    height: 100vh; /* Hauteur complète de la fenêtre */
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
    text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.6);
}

.movie-info {
    padding: 30px;
    text-align: center;
    font-family: 'Arial', sans-serif;
}

.movie-info h2 {
    font-size: 1.5rem;
    margin-bottom: 15px;
}

.movie-info p {
    font-size: 1.2rem;
    line-height: 1.6;
    color: #bbb;
}

.movie-info h2:first-of-type {
    font-size: 2rem;
    font-weight: bold;
    margin-bottom: 20px;
}



.movie-info h2, .movie-info p {
    margin: 10px 0;
}

.movie-info h2:hover {
    color: #ff7e5f; /* Changer la couleur au survol */
    cursor: pointer;
    transition: color 0.3s ease;
}

.movie-info p {
    font-style: italic;
}

@media screen and (max-width: 768px) {
    .movie-info {
        padding: 20px;
        font-size: 1rem;
    }

    .movie-info h2 {
        font-size: 1.2rem;
    }

    .movie-info p {
        font-size: 1rem;
    }
}



        .showtimes-table {
    background: rgba(0, 0, 0, 0.7);
    border-radius: 15px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
    margin-top: 20px;
}

.showtimes-table th, .showtimes-table td {
    vertical-align: middle;
    color: #fff;
}

.showtimes-table th {
    background: #000; /* Black background */
    font-size: 1.2rem;
     
}

.showtimes-table td {
    font-size: 1.1rem;
}

.book-now-btn {
    font-size: 1rem;
    background: linear-gradient(to right, #ff7e5f, #feb47b);
    border: none;
    color: #fff;
    padding: 12px 20px;
    border-radius: 30px;
    display: inline-flex;
    align-items: center;
    gap: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease;
}

.book-now-btn:hover {
    background: linear-gradient(to right, #feb47b, #ff7e5f);
    transform: scale(1.05);
}



          .footer-separator {
    width: 80%;
    border: 0.5px solid #444;
}

.footer-copyright {
    font-size: 12px;
    color: #bbb;
    text-align: center;
}

 .footer {
    background-color: rgba(0, 0, 0, 0,1); 
    
    color: white;
    padding: 20px;
    font-size: 14px;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 20px;
}

.footer-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    width: 100%;
    max-width: 1200px;
}

  .footer-section {
    flex: 1;
    padding: 10px;
    text-align: center;
}

.footer-section h3 {
    color: #e50914;
    margin-bottom: 10px;
}

.footer-links {
    display: flex;
    flex: 2;
    justify-content: space-around;
}

.footer-column {
    padding: 10px;
}

.footer-column h4 {
    margin-bottom: 10px;
    color: #e50914;
}

.footer-column a {
    display: block;
    text-decoration: none;
    color: white;
    margin-bottom: 5px;
    transition: color 0.3s ease;
}

.footer-column a:hover {
    color: #e50914;
}
.social-icons {
    display: flex;
    gap: 10px;
}

.social-icons img {
    width: 40px;
    height: 40px;
    cursor: pointer;
    transition: transform 0.3s ease;
}

.social-icons img:hover {
    transform: scale(1.2);
}
    </style>
</head>
<body>
    <!-- Navbar -->
     <div class="navbar">
        <div class="logo">RedCiné</div>
        <div class="menu">
            <a href="Home.jsp">Home</a>
            <a href="movieslist.jsp">Movies</a>
            <a href="contact.jsp">Contact</a>
        </div>
        <div class="auth-buttons">
            <a href="Home.jsp">Logout</a>
           
        </div>
    </div>
    <video autoplay muted loop id="background-video">
         <source src="video/824f7aca-00a8-4e28-b1b2-8ff82cc38893.mp4" type="video/mp4">
             Your browser does not support the video tag.
         </video>
    
    <!-- Movie Details Section -->
    <div class="movie-background">
        <div class="movie-info">
            <h2>ID:<%= movie.getId_film() %></h2>
            <h2>Nom:<%= movie.getNom() %></h2>
             
            <h2>Genre:<%= movie.getGenre() %></h2>
            <h2>Score:<%= movie.getRating() %></h2>
            <h2>Description:<p><%= movie.getDescription() != null ? movie.getDescription() : "No description available." %></p></h2>
            
        </div>
    </div>

    <div class="container">
        <h2 class="text-center mb-5">Horaire des séances</h2>

        <div class="table-responsive showtimes-table">
            <table class="table table-dark table-hover">
                <thead>
                    <tr>
                        <th>Seance ID</th>
                        <th>Date de séance</th>
                        <th>Places disponibles</th>
                        <th>Prix</th>
                        <th>Réserver</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    if (Sessions != null && !Sessions.isEmpty()) {
                        for (Seance movieSession : Sessions) {
                    %>
                        <tr>
                            <td><%= movieSession.getId_seance() %></td>
                            <td><%= movieSession.getHoraire() %></td>
                            <td><%= movieSession.getPlaces() %></td>
                            <td>$<%= movieSession.getTarif() %></td>
                            <td>
                                <form action="BookingController" method="get">
                                    <input type="hidden" name="sessionId" value="<%= movieSession.getId_seance() %>">
                                    <input type="hidden" name="movieId" value="<%= movie.getId_film() %>">
                                    <button type="submit" class="btn book-now-btn">
                                        <i class="fas fa-ticket-alt"></i> Book Now
                                    </button>
                                </form>
                            </td>
                        </tr>
                    <% 
                        }
                    } else {
                    %>
                    <tr><td colspan="5" class="text-center">No showtimes available for this movie.</td></tr>
                    <% 
                    } 
                    %>
                </tbody>
            </table>
        </div>

       <a href="movieslist.jsp" class="btn btn-danger">Back to Movies List</a>

    </div>

    <!-- Footer -->
    <hr class="footer-separator">

    <!-- Footer -->
    <div class="footer">
    <div class="footer-container">
        <!-- Section principale avec les liens -->
        <div class="footer-section">
            <h3>RedCiné</h3>
            <p>Your one-stop destination for the latest movies and showtimes.</p>
        </div>
        
        <div class="footer-links">
            
            <div class="footer-column">
                <h4>Customer Support</h4>
                <a href="#">FAQ</a>
                <a href="#">Terms of Service</a>
                <a href="#">Privacy Policy</a>
            </div>
            <div class="footer-column">
                <h4>Follow Us</h4>
                <div class="social-icons">
                    <a href="https://www.facebook.com/pathefilms/?locale=fr_FR"><img src="image/facebook.png" alt="Facebook"></a>
                    <a href="https://x.com/PatheFilms?mx=2"><img src="image/twitter.png" alt="Twitter"></a>
                    <a href="https://www.instagram.com/pathefilms/?hl=fr"><img src="image/instagram.png" alt="Instagram"></a>
                    <a href="https://www.youtube.com/watch?v=th-x6U0wp-A"><img src="image/youtube.png" alt="YouTube"></a>
                </div>
            </div>
            </div>
        </div>
    </div>

    <!-- Ligne de séparation -->
    <hr class="footer-separator">

    <!-- Section copyright -->
    <div class="footer-copyright">
        <p>&copy; 2025 RedCiné. All rights reserved. | Designed with ❤️ by RedCiné Team.</p>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
