# RedCiné — Cinema Booking Web Application

RedCiné is a web application for browsing movies and booking cinema seats, built with Jakarta EE following the MVC pattern. It was developed as an academic project at the National Engineering School of Tunis (ENIT).

## Features

- User sign-up, login and logout
- Movie catalogue with search by title
- Movie details with available screenings
- Seat booking with availability check
- Payment from the user's account balance, with booking confirmation
- Contact page and list of cinemas

## Architecture

The application follows a layered MVC architecture:

- **View:** JSP pages (`src/main/webapp`)
- **Controller:** servlets handling HTTP requests (`com.enit.controller`)
- **Model:** EJB session beans containing the business logic (`com.enit.service`) and JPA entities mapped to MySQL (`com.enit.entities`)

Business rules such as sold-out screenings or insufficient balance are handled through dedicated exceptions.

## Tech stack

- **Backend:** Java 21 · Jakarta EE (Servlets, EJB, JPA) · Hibernate
- **Frontend:** JSP · HTML · CSS · JavaScript
- **Database:** MySQL
- **Server:** WildFly 27
- **IDE:** Eclipse with JBoss Tools

## Getting started

1. Clone the repository:
```bash
   git clone https://github.com/rihem-khouildi/redcine-cinema-booking.git
```
2. Create a MySQL database for the application.
3. In WildFly, configure a MySQL datasource with the JNDI name `java:/cinemaDS`.
4. Import the project into Eclipse (**File → Import → Existing Projects into Workspace**).
5. Run the project on the WildFly server (**Run As → Run on Server**) and open `Home.jsp`.

Tables are created automatically by Hibernate on first deployment.

> Movie trailers are not included in this repository. Place your own video files in `src/main/webapp/video/`.

## Authors

- **Rihem Khouildi** — [GitHub](https://github.com/rihem-khouildi)
- **Maram Dahmen** 