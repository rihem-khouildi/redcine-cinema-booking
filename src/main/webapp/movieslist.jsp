<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.enit.entities.Film" %>
<%
List<Film> movies = (List<Film>) request.getAttribute("movies");

    // Redirect to the servlet if `films` attribute is missing
    if (movies == null) {
        response.sendRedirect("movie");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie List</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
    body {
        margin: 0;
        font-family: 'Helvetica Neue', Arial, sans-serif;
        background-color: #141414; /* Netflix's signature dark background */
        color: #fff;
        line-height: 1.6;
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

    .modal-content {
    background-color: #222;
    color: white;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
}

.modal-header {
    border-bottom: 1px solid #444;
}

.modal-title {
    font-size: 20px;
    color: #e50914;
}

.btn-close {
    filter: invert(1);
}

.modal-body {
    padding: 20px;
}

.modal-body h4 {
    font-size: 24px;
    margin-bottom: 10px;
    color: #e50914;
}

.modal-body p {
    font-size: 16px;
    color: #ddd;
}

.modal-body strong {
    color: #e50914;
}

.btn-custom {
    background-color: #e50914;
    color: white;
    border: none;
    transition: background-color 0.3s ease;
}

.btn-custom:hover {
    background-color: #d40813;
}

/* Footer Button */
.modal-footer .btn-secondary {
    background-color: #444;
    border: none;
    color: white;
}

.modal-footer .btn-secondary:hover {
    background-color: #555;
}

/* Movies Section */
.movie-section {
    background-color: #121212;
    padding: 40px 20px;
    color: white;
    text-align: center;
}

.movie-list-header h1 {
    font-size: 28px;
    color: #e50914;
    margin-bottom: 10px;
}

.movie-list-header p {
    font-size: 16px;
    color: #ddd;
    margin-bottom: 30px;
}

/* Search Bar */
/* Search Bar - Full Width */
.search-container {
    display: flex;
    justify-content: center;
    width: 100%;
    margin-bottom: 20px;
}

.search-container .form-control {
    flex: 1; /* Permet au champ de recherche de s'étirer */
    border: 1px solid #444;
    border-right: none;
    border-radius: 30px 0 0 30px;
    background-color: #333;
    color: white;
    padding: 10px 20px;
}

.search-container .btn-primary {
    border-radius: 0 30px 30px 0;
    background-color: #e50914;
    border: none;
    color: white;
    transition: background-color 0.3s ease;
}

.search-container .btn-primary:hover {
    background-color: #d40813;
}
/* Table Container Styling */
/* Table Container Styling */
.table-container {
    margin-top: 20px;
    padding: 10px;
    border-radius: 10px;
    background: #121212; /* Dark background for the entire table container */
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
    overflow: hidden;
}

/* Table Styling */
.table {
    width: 100%;
    border-collapse: collapse;
    background-color: #121212; /* Dark background for the table */
    color: #ffffff;
    border-radius: 10px;
}

/* Enhanced Table Header */
.table th {
    background-color: #1e1e1e; /* Slightly lighter dark background */
    color: #ffffff; /* White text */
    text-transform: uppercase;
    padding: 20px;
    font-size: 16px;
    font-weight: bold;
    border-bottom: 3px solid #e50914; /* Red border */
    letter-spacing: 1px;
    text-align: center;
    transition: background-color 0.3s ease, transform 0.3s ease;
}

/* Hover Effect for Table Header */
.table th:hover {
    background-color: #333333; /* Darker header background on hover */
    transform: scale(1.05); /* Zoom effect */
}

/* Table Body */
.table td {
    text-align: center;
    padding: 15px;
    font-size: 14px;
    border-bottom: 1px solid #333333; /* Darker border between rows */
    transition: background-color 0.3s ease, transform 0.3s ease;
}

/* Hover Effect for Table Rows */
.table tbody tr:hover {
    background-color: #222222; /* Slightly lighter dark background */
    transform: scale(1.02);
}

/* Movie Poster Styling (Increased size for attraction) */
.movie-poster {
    width: 120px; /* Increased size */
    height: 180px; /* Increased size */
    object-fit: cover;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.6); /* Bigger shadow */
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

/* Hover Effect for Movie Poster */
.movie-poster:hover {
    transform: scale(1.1); /* Slight zoom effect */
    box-shadow: 0 6px 16px rgba(0, 0, 0, 0.8); /* Enhanced shadow */
}

/* Responsive Table */
@media (max-width: 768px) {
    .table th,
    .table td {
        font-size: 12px;
        padding: 8px;
    }
    .movie-poster {
        width: 100px;
        height: 150px;
    }
}
}footer-separator {
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

    <!-- Modal for Profile -->
    <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="profileModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="profileModalLabel">User Profile</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <h4>Welcome !</h4>
                    <p>Username :</p>
                    <p>Account Balance: <strong>${requestScope.solde} USD</strong></p>
                    <hr>
                    <div class="d-grid gap-3">
                        <a href="myReservations.jsp" class="btn btn-custom"><i class="fas fa-ticket-alt"></i> My Reservations</a>
                        <a href="editProfile.jsp" class="btn btn-custom"><i class="fas fa-user-edit"></i> Edit Profile</a>
                        <a href="#" class="btn btn-custom"><i class="fas fa-wallet"></i> My Balance</a>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Movies Section -->
    <div class="movie-section">

        <div class="container">
            <div class="movie-list-header">
                <h1> Bienvenue sur RedCiné : Votre portail pour découvrir des films incroyables</h1>
                <p>Recherchez, explorez et plongez dans une collection de récits fascinants.</p>
            </div>

            <!-- Search Bar -->
            <form class="input-group ms-2" method="get" action="movie">
                <div class="search-container">
                    <input type="text" name="search" class="form-control" placeholder="Search for a movie..." aria-label="Search" aria-describedby="search-button">
                    <button class="btn btn-primary" type="submit" id="search-button">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </form>

            <!-- Movie Table -->
            <div class="table-container">
                <table class="table table-striped table-dark">
                    <thead>
                        <tr>
                            <th>Poster</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Genre</th>
                            <th>Rating</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                    if (!movies.isEmpty()) {
                        for (Film movie : movies) {
                    %>
                        <tr>
                            <td> 
                                <a href="movieDetails?id=<%= movie.getId_film() %>">
                                    <img src="test/<%= movie.getId_film() %>.jpg" class="movie-poster" alt="<%= movie.getNom() %> Poster" onerror="this.src='image/spiderman.jpg'">
                                </a>
                            </td>
                            <td><%= movie.getNom() != null ? movie.getNom() : "N/A" %></td>
                            <td><%= movie.getDescription() != null ? movie.getDescription() : "N/A" %></td>
                            <td><%= movie.getGenre() != null ? movie.getGenre() : "N/A" %></td>
                            <td><%= movie.getRating() != 0 ? movie.getRating() : "N/A" %></td>
                        </tr>
                    <%
                        }
                    } else {
                    %>
                        <tr>
                            <td colspan="5" style="text-align: center;">No movies found.</td>
                        </tr>
                    <%
                    }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
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
    </div>


    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
