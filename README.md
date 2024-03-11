# Billinho Project

The Billinho Project is an API developed to simulate a system for managing tuition fees paid by students to an educational institution. This API was created as part of a technical challenge with the goal of providing a robust and efficient solution for managing information related to educational institutions, students, enrollments, and invoices.

## Technologies Used

- **Ruby on Rails**: Framework used to develop the API.
- **PostgreSQL**: Database used to store the application's data.
- **Git**: Version control system used to version the source code.
- **GitHub**: Code hosting platform used to store the project repository.

## Ruby Gems

- **Faker**: Faker gem for fake data generating. 
- **Rubocop**: Ruby static code analyzer and formatter.
- **Pg**: PostgreSQL gem for database configuration.

## Prerequisites

Before running the application locally, ensure the following software is installed on your machine:

- Ruby
- Ruby on Rails
- PostgreSQL

## Installation

Follow the instructions below to set up and run the project locally:

1. **Clone the repository:**

```bash
git clone https://github.com/JoaoLive100/billinho-api.git
cd billinho-project
```

2. **Install dependencies:**

```bash
bundle install
```

3. **Configure the database:**

```bash
rails db:create
rails db:migrate
```

4. **Start the server:**

```bash
rails server
```

5. **Access the API:**

Open a web browser and go to `http://localhost:3000` or use tools like Postman to send HTTP requests to the API.

## API Routes

### Educational Institutions

- **List all educational institutions:**

```http
GET /institutions
```

- **Create a new educational institution:**

```http
POST /institutions
```

- **Get a specific educational institution:**

```http
GET /institutions/:id
```

- **Update an existing educational institution:**

```http
PUT /institutions/:id
```

- **Delete an existing educational institution:**

```http
DELETE /institutions/:id
```

### Students

- **List all students:**

```http
GET /students
```

- **Create a new student:**

```http
POST /students
```

- **Get a specific student:**

```http
GET /students/:id
```
- **Update an existing student:**

```http
PUT /students/:id
```

- **Delete an existing student:**

```http
DELETE /students/:id
```

### Enrollments

- **List all enrollments:**

```http
GET /enrollments
```

- **Create a new enrollment:**

```http
POST /enrollments
```

- **Get a specific enrollment:**

```http
GET /enrollments/:id
```

- **Update an existing enrollment:**

```http
PUT /enrollments/:id
```

- **Delete an existing enrollment:**

```http
DELETE /enrollments/:id
```

### Invoices

- **List all invoices:**

```http
GET /invoices
```

- **Create a new invoice:**

```http
POST /invoices
```

- **Get a specific invoice:**

```http
GET /invoices/:id
```

- **Update an existing invoice:**

```http
PUT /invoices/:id
```

- **Delete an existing invoice:**

```http
DELETE /invoices/:id
```