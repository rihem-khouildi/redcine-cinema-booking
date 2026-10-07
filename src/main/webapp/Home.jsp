<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RedCiné</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #141414;
            color: white;
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

        .carousel {
            position: relative;
            width: 100%;
            height: 100vh; /* Hauteur de la fenêtre visible */
            overflow: hidden;
        }

        .carousel-video {
            width: 100%;
            height: 100%;
            object-fit: cover; /* Ajuste la vidéo pour remplir l'écran */
            position: absolute;
            top: 0;
            left: 0;
            z-index: -1; /* Place la vidéo derrière le contenu */
        }

        .carousel-content {
            position: absolute;
            bottom: 20%;
            left: 10%;
            color: white;
            max-width: 600px;
            z-index: 2; /* Place le contenu au-dessus de la vidéo */
        }
        .separator {
            text-align: center;
            margin: 20px 0;
            font-size: 18px;
            color: #e50914;
            font-weight: bold;
        }
        .poster-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 10px; /* Réduction de l'espacement entre les lignes et colonnes */
            margin: 20px;
        }
        .poster {
            text-align: center;
        }
        .poster img {
            width: 100%;
            border-radius: 10px;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
            transition: transform 0.3s ease-in-out;
        }
        .poster img:hover {
            transform: scale(1.05);
        }
        .poster h3 {
            margin: 10px 0 5px;
        }
        .poster p {
            font-size: 14px;
            color: #bbb;
        }

        .carousel-content h1 {
            font-size: 64px;
            margin: 0 0 10px;
            text-transform: uppercase;
        }

        .carousel-content p {
            font-size: 20px;
            margin: 10px 0;
        }

        .carousel-content .buttons {
            margin-top: 20px;
        }

        .carousel-content .buttons button {
            padding: 10px 20px;
            margin-right: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .carousel-content .buttons .trailer-btn {
            background-color: #e50914;
            color: white;
        }

        .carousel-content .buttons .tickets-btn {
            background-color: #444;
            color: white;
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
            <a href="Login.jsp">Movies</a>
            <a href="contact.jsp">Contact</a>
        </div>
        <div class="auth-buttons">
            <a href="Login.jsp">Sign In</a>
            <a href="signup.jsp">Sign Up</a>
        </div>
    </div>

    <!-- Carousel Section -->
    <div class="carousel">
        <!-- Vidéo intégrée en arrière-plan -->
        <video autoplay muted loop class="carousel-video">
            <source src="video/Mufasa_ The Lion King .mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>
        <div class="carousel-content">
            <h1>Mufasa: The Lion King</h1>
            <p>Released: Aug 23</p>
            <p> Les aventures de Mufasa, le père de Simba, avant qu'il ne devienne l'un des plus grands rois de la Terre des Lions.</p>
            <div class="buttons">
                <!-- Lien vers YouTube pour Watch Trailer -->
                <a href="https://www.youtube.com/watch?v=y5yk-HGqKmM" target="_blank" style="text-decoration: none;">
                    <button class="trailer-btn">Watch Trailer</button>
                </a>
                 <a href="movieslist.jsp" style="text-decoration: none;">
                   <button >Learn more</button>
                 </a>
            </div>
        </div>
    </div>
    
    <div class="separator">
        <p>Découvrez nos films les plus récents</p>
    </div>

    <div class="poster-grid">
        <!-- Répétez ce bloc pour chaque film -->
        <div class="poster">
            <a href="booking.jsp?movieId=1" style="text-decoration: none;">
                <img src="image/1.jpg" alt="The Mummy">
            </a>
            <h3>Dahmer</h3>
            <p>2h 10m</p>
        </div>
        <div class="poster">
            <a href="booking.jsp?movieId=2" style="text-decoration: none;">
                <img src="image/3.jpg" alt="Wonder Woman">
            </a>
            <h3>The 100</h3>
            <p>2h 21m</p>
        </div>
        <div class="poster">
            <a href="booking.jsp?movieId=3" style="text-decoration: none;">
                <img src="image/4.jpg" alt="Alien: Covenant">
            </a>
            <h3>Smile2</h3>
            <p>2h 2m</p>
        </div>
        <div class="poster">
            <a href="booking.jsp?movieId=4" style="text-decoration: none;">
                <img src="image/5.jpg" alt="Baywatch">
            </a>
            <h3>A contre sens</h3>
            <p>1h 56m</p>
        </div>
        <div class="poster">
            <a href="booking.jsp?movieId=5" style="text-decoration: none;">
                <img src="image/6.jpg" alt="Pirates of the Caribbean">
            </a>
            <h3>For life</h3>
            <p>2h 33m</p>
        </div>
        <div class="poster">
            <a href="booking.jsp?movieId=6" style="text-decoration: none;">
                <img src="image/7.jpg" alt="Transformers">
            </a>
            <h3>1917</h3>
            <p>2h 29m</p>
        </div>
        <div class="poster">
            <a href="booking.jsp?movieId=7" style="text-decoration: none;">
                <img src="image/2.jpg" alt="Transformers">
            </a>
            <h3>ABIGAIL</h3>
            <p>2h 29m</p>
        </div>
    </div>

    <div class="separator">
        <p>Prochaines sorties au cinéma</p>
    </div>

    <div class="poster-grid">
        <div class="poster">
            <a href="booking.jsp?movieId=8" style="text-decoration: none;">
                <img src="image/7.jpg" alt="Transformers">
            </a>
            <h3>1917</h3>
            <p>2h 29m</p>
        </div>
        <div class="poster">
            <a href="booking.jsp?movieId=9" style="text-decoration: none;">
                <img src="image/8.jpg" alt="Planet of the Apes">
            </a>
            <h3>Stalker</h3>
            <p>2h 20m</p>
        </div>
        <div class="poster">
            <a href="booking.jsp?movieId=10" style="text-decoration: none;">
                <img src="image/9.jpg" alt="The Dark Tower">
            </a>
            <h3>Buster's mal heart</h3>
            <p>1h 35m</p>
        </div>
        <div class="poster">
            <a href="booking.jsp?movieId=11" style="text-decoration: none;">
                <img src="image/10.jpg" alt="The Dark Tower">
            </a>
            <h3>The Patient</h3>
            <p>1h 35m</p>
        </div>
        <div class="poster">
            <a href="booking.jsp?movieId=3" style="text-decoration: none;">
                <img src="image/11.jpg" alt="Alien: Covenant">
            </a>
            <h3>Photocopier</h3>
            <p>2h 2m</p>
        </div>
        <div class="poster">
            <a href="booking.jsp?movieId=12" style="text-decoration: none;">
                <img src="image/15.jpg" alt="The Dark Tower">
            </a>
            <h3>Joker</h3>
            <p>1h 35m</p>
        </div>
        <div class="poster">
            <a href="booking.jsp?movieId=13" style="text-decoration: none;">
                <img src="image/12.jpg" alt="The Dark Tower">
            </a>
            <h3>The antenna</h3>
            <p>1h 35m</p>
        </div>
    </div>
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


</body>
</html>
