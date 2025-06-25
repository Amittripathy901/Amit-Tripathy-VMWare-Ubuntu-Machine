
# DevOps Shack User Management App

This is a full-stack application for managing users with a front-end built using HTML, CSS, and JavaScript, and a back-end powered by Node.js, Express, and MySQL.

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Setup Instructions](#setup-instructions)
  - [1. Setting Up MySQL Server](#1-setting-up-mysql-server)
  - [2. Configuring and Running the Client](#2-configuring-and-running-the-client)
  - [3. Configuring and Running the Server](#3-configuring-and-running-the-server)
- [Usage](#usage)
- [License](#license)

## Features

- Add new users with a name, email, and role (User/Admin).
- View a list of all users.
- Edit user details.
- Delete users.
- Responsive and user-friendly UI.
- Smooth animations and minimalistic design.

## Prerequisites

Before setting up this project, ensure you have the following installed on your machine:

- [Node.js](https://nodejs.org/) (version 12.x or higher)
- [MySQL](https://www.mysql.com/) (version 5.7 or higher)

## Setup Instructions

### 1. Setting Up MySQL Server

First, you need to set up a MySQL server on your local machine.

1. **Update the package index:**

   ```bash
   sudo apt update
   ```

2. **Install the MySQL server:**

   ```bash
   sudo apt install mysql-server
   ```

3. **Log in to the MySQL shell as root:**

   ```bash
   sudo mysql -u root
   ```

4. **Set a password for the root user and update the authentication method:**

   ```sql
   ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
   FLUSH PRIVILEGES;
   ```

   Replace `'password'` with a secure password of your choice.

5. **Exit the MySQL shell:**

   ```sql
   exit;
   ```

6. **Log in to the MySQL shell again with the new password:**

   ```bash
   sudo mysql -u root -p
   ```

   Enter the password you set in the previous step.

7. **Create a new database:**

   ```sql
   CREATE DATABASE test_db;
   ```

8. **Switch to the new database:**

   ```sql
   USE test_db;
   ```

9. **Create the `users` table:**

   ```sql
   CREATE TABLE users (
       id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(255) NOT NULL,
       email VARCHAR(255) NOT NULL UNIQUE,
       role ENUM('Admin', 'User') NOT NULL
   );
   ```

   This table will store user information, including their name, email, and role.

### 2. Configuring and Running the Client

The client side of the application is built using modern JavaScript, HTML, and CSS. To configure and run the client:

1. **Navigate to the client folder:**

   ```bash
   cd client
   ```

2. **Install the required dependencies:**

   ```bash
   npm install
   ```

3. **Build the client application:**

   ```bash
   npm run build
   ```

   This will create a production build of the client application, which will be served by the Express server.

### 3. Configuring and Running the Server

The server side is built using Node.js and Express and connects to the MySQL database to manage user data.

1. **Navigate to the server folder:**

   ```bash
   cd server
   ```

2. **Install the required dependencies:**

   ```bash
   npm install
   ```

3. **Start the server:**

   ```bash
   npm start
   ```

   The server will run on `http://localhost:5000` by default.

## Usage

After following the setup instructions, you can access the application by navigating to `http://localhost:5000` in your web browser.

### User Management Features:

- **Add User:** Fill in the name, email, and role in the form and click "Add User" to add a new user.
- **View Users:** The user list will be displayed below the form. Each user entry will have "Edit" and "Delete" buttons.
- **Edit User:** Click the "Edit" button next to a user entry to update their details.
- **Delete User:** Click the "Delete" button next to a user entry to remove them from the list.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### NOTE: This Application Should not be used for commercial purpose by anyone else other than DevOps Shack

