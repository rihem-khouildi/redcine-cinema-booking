<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.enit.entities.Seance" %>

<%
Seance movieSession = (Seance) request.getAttribute("session");
    if (movieSession == null) {
        response.sendRedirect("sessions");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reserver vos places</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background: url("image/14dc9307-b97c-4b7f-ab6a-49f15f0b8966.jpg") no-repeat center center fixed;
            background-size: cover;
            color: #fff;
            line-height: 1.8;
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


        .booking-section {
    display: flex;
    justify-content: center; /* Centre le contenu horizontalement */
    align-items: center; /* Centre le contenu verticalement */
    min-height: 100vh; /* Assure que la section prend toute la hauteur de la fenêtre */
}

.container {
    text-align: center; /* Centre le texte à l'intérieur de .container */
    max-width: 600px; /* Limite la largeur du conteneur */
    width: 100%; /* S'assure que le conteneur occupe toute la largeur possible */
}

.booking-container {
    background-color: rgba(0, 0, 0, 0.7); /* Fond sombre pour le conteneur */
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5); /* Ombre pour un effet de profondeur */
    color: white;
    text-align: left; /* Garde le texte aligné à gauche à l'intérieur du formulaire */
}

.booking-container p {
    font-size: 1.2rem;
    margin-bottom: 10px;
}

.booking-container .form-label {
    font-size: 1.1rem;
}

.booking-container .form-control {
    font-size: 1rem;
    padding: 10px;
    width: 100%; /* S'assure que le champ prend toute la largeur disponible */
}

.booking-container .btn-danger {
    font-size: 1rem;
    background-color: #ff4747; /* Couleur rouge */
    border: none;
    padding: 10px 20px;
    border-radius: 30px;
    cursor: pointer;
}

.booking-container .btn-danger:hover {
    background-color: #ff2a2a; /* Effet au survol */
}


        button {
            font-size: 1.2rem;
            font-weight: bold;
            background: #e50914;
            color: #fff;
            border: none;
            padding: 12px 20px;
            border-radius: 30px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
        }

        button:hover {
            background: #b20710;
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

    <!-- Booking Section -->
    <div class="booking-section">
        <div class="container">
            <h2><center> Réserver vos places </center></h2>
            <div class="booking-container">
                <p><strong>Seance ID:</strong> <%= movieSession.getId_seance() %></p>
                <p><strong>Date de séance:</strong> <%= movieSession.getHoraire() %></p>
                <p><strong>Places disponibles:</strong> <%= movieSession.getPlaces() %></p>
                <p><strong>Prix:</strong> $<%= movieSession.getTarif() %></p>
                
                <form action="BookingController" method="post">
                    <input type="hidden" name="sessionId" value="<%= movieSession.getId_seance() %>">
                    <div class="mb-3">
                        <label for="seats" class="form-label">Choisissez le nombre de places:</label>
                        <input type="number" class="form-control" id="seats" name="seats" required>
                    </div>
                    <button type="submit" class="btn btn-danger"> Confirmez votre réservation </button>
                </form>
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
