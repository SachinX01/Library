# Online Library Management System

This is an Online Library Management System built with PHP and MySQL. It allows users to manage books, categories, publications, and issued books. It also provides functionalities for user registration, login, and profile management.

## Project Structure

## Features

- User Registration and Login
- Admin Dashboard
- Manage Books, Categories, and Publications
- Issue and Return Books
- Generate Reports (User-wise, Overdue, Class-wise)
- User Profile Management

## Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/SachinX01/Library.git
    ```

2. Navigate to the project directory:
    ```sh
    cd Library
    ```

3. Install dependencies using Composer:
    ```sh
    composer install
    ```

4. Import the database:
    - Create a database named `library`.
    - Import the [library.sql](http://_vscodecontentref_/22) file into the database.

5. Configure the database connection:
    - Update the database configuration in [config.php](http://_vscodecontentref_/23).

## Usage

- Access the application in your browser:
    ```sh
    http://localhost/Library
    ```

- Admin Login:
    ```sh
    http://localhost/Library/adminlogin.php
    ```

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request for any improvements.

## License

This project is licensed under the MIT License.
