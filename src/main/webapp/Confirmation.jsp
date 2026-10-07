<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmation</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
       body {
    margin: 0;
    font-family: 'Roboto', sans-serif;;
    background: url("image/249a5540-52c0-42b1-9a1f-e98c1e288ed9.jpg") no-repeat center center fixed; /* Background image */
    background-size: cover; /* Ensures the image covers the entire background */
    background-color:black;
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

/* Confirmation Section Styling */
.confirmation-section {
    
    color: #ffffff;
     width: 70%; /* Augmentez la largeur (ex. 70%, 80% ou 100%) */
    padding: 30px 10px; /* Ajoutez plus d'espace intérieur */
    margin: 100px auto; 
    background: none;/* Remove the background */
}

.confirmation-section h1 {
    font-size: 50px;
    margin-bottom: 30px;
    color: #e50914; /* Red heading */
    text-align: center;
}

.confirmation-section p {
    font-size: 20px;
    margin-bottom: 20px;
    text-align: center;
}

.confirmation-section .text-success {
    color: white; /* Change to white text */
    font-weight: bold;
    font-size: 18px;
    text-align: center;
}

.confirmation-section .btn-outline-light {
    color: #e50914; /* Red border for button */
    border: 2px solid #e50914;
    padding: 12px 20px;
    border-radius: 8px;
    font-size: 16px;
    text-transform: uppercase;
    transition: all 0.3s ease;
}

.confirmation-section .btn-outline-light:hover {
    background-color: #e50914;
    color: #ffffff;
    border-color: #e50914;
}    .footer-separator {
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
            <a href="Login.jsp">Movies</a>
            <a href="contact.jsp">Contact</a>
        </div>
        <div class="auth-buttons">
            <a href="Home.jsp">Logout</a>
           
        </div>
    </div>
    <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="profileModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="profileModalLabel">User Profile</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                   
                    
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
    
    <!-- Confirmation Section -->
    <div class="confirmation-section">
        <div class="container">
            <div class="confirmation-container">
                <h1 class="mb-4">Réservation confirmée</h1>
                <p><strong>Séance ID:</strong> <%= request.getParameter("sessionId") %></p>
                <p><strong>places réservées :</strong> <%= request.getParameter("seats") %></p>
                <p >Merci d'avoir réservé avec nous ! Installez-vous confortablement et profitez du film.</p>
                <div class="text-center mt-4">
                    <a href="movie" class="btn btn-outline-light">Back to Movies</a>
                </div>
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
    

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
