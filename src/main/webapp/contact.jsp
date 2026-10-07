<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RedCiné - Contact</title>
    <style>
        /* Styles généraux hérités du précédent code */
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
            background-color: rgba(0, 0, 0, 0,1);
            padding: 15px 20px;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(10px);
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

        .form-container {
            margin: 40px auto;
            padding: 20px;
            background-color: #2c2c2c;
            border-radius: 8px;
            width: 50%;
        }

        .form-container h2 {
            text-align: center;
            color: #e50914;
        }

        .form-container label {
            color: white;
            font-size: 16px;
            display: block;
            margin: 10px 0 5px;
        }

        .form-container input,
        .form-container textarea {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #444;
            background-color: #333;
            color: white;
            margin-bottom: 15px;
        }

        .form-container button {
            width: 100%;
            padding: 12px;
            background-color: #e50914;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-container button:hover {
            background-color: #d40813;
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
            <a href="Login.jsp">Sign In</a>
            <a href="signup.jsp">Sign Up</a>
        </div>
    </div>

    <!-- Contact Form Section -->
    <div class="form-container">
        <h2>Contactez-nous</h2>
        <form action="submit-contact.jsp" method="POST">
            <label for="name">Nom</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>

            <label for="message">Message</label>
            <textarea id="message" name="message" rows="5" required></textarea>

            <button type="submit">Envoyer</button>
        </form>
    </div>

    <hr class="footer-separator">

    <!-- Footer -->
    <div class="footer">
        <div class="footer-container">
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

    <hr class="footer-separator">

    <!-- Section copyright -->
    <div class="footer-copyright">
        <p>&copy; 2025 RedCiné. All rights reserved. | Designed with ❤️ by RedCiné Team.</p>
    </div>
</body>
</html>
