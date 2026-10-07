<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        /* Existing styles here */
        .balance-section {
            margin-top: 20px;
            padding: 15px;
            background-color: #343a40;
            color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
        }

        .balance-section h4 {
            font-size: 1.5rem;
            margin-bottom: 10px;
        }

        .balance-section p {
            font-size: 1.2rem;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="UserHomePage.jsp">MovieBooking</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="movieslist.jsp"><i class="fas fa-film"></i> Movies</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="myMovies.jsp"><i class="fas fa-film"></i> My Movies</a>
                    </li>
                </ul>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="Login.jsp"><i class="fas fa-sign-out-alt"></i> Log Out</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link profile-icon" href="Profile.jsp"><i class="fas fa-user-circle"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Profile Section -->
    <div class="profile-section">
        <h1>Your Profile</h1>
        <p>Manage your account details and preferences here.</p>
        <div class="container profile-details">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="profile-card">
                        <h3 class="mb-4">User Details</h3>
                        <p><strong>Name:</strong> John Doe</p>
                        <p><strong>Email:</strong> john.doe@example.com</p>
                        <p><strong>Phone:</strong> +1-234-567-890</p>
                        <p><strong>Member Since:</strong> January 2023</p>
                        <!-- Balance Section -->
                        <div class="balance-section">
                            <h4>Account Balance</h4>
                            <p>${requestScope.solde} USD</p>
                        </div>
                        <a href="editProfile.jsp" class="btn btn-primary mt-3">Edit Profile</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 MovieBooking. All rights reserved.</p>
        <p>Follow us on <a href="#">Twitter</a>, <a href="#">Facebook</a>, <a href="#">Instagram</a></p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
