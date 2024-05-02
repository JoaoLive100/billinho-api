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

4. **Generating data:**

```bash
rails db:seed
```

5. **Start the server:**

```bash
rails server
```

6. **Access the API:**

Open a web browser and go to `http://localhost:3000` or use tools like Postman to send HTTP requests to the API.

## API Routes

### Educational Institutions

```http
(all institutions)
GET /institutions/all

(all disabled institutions)
GET /institutions/disabled

(all enabled institutions)
GET /institutions

(institution by id)
GET /institutions/:id

(create institution)
POST /institutions

(update institution)
PUT /institutions/:id

(delete institution)
DELETE /institutions/:id
```

### Students

```http
(all students)
GET /students/all

(all disabled students)
GET /students/disabled

(all enabled students)
GET /students

(student by id)
GET /students/:id

(create student)
POST /students

(update student)
PUT /students/:id

(delete student)
DELETE /students/:id
```

### Enrollments

```http
(enrollments by student id)
GET /enrollments/student_enrollments/:student_id

(enrollments by institution id)
GET /enrollments/institution_enrollments/:institution_id

(all enrollments)
GET /enrollments/all

(all disabled enrollments)
GET /enrollments

(all enabled enrollments)
GET /enrollments

(enrollment by id)
GET /enrollments/:id

(create enrollment)
POST /enrollments

(update enrollment)
PUT /enrollments/:id

(delete enrollment)
DELETE /enrollments/:id
```

### Invoices

```http
(invoices by student id)
GET /invoices/student_invoices/:student_id

(invoices by institution id)
GET /invoices/institution_invoices/:institution_id

(invoices by enrollment id)
GET /invoices/enrollment_invoices/:enrollment_id

(all invoices)
GET /invoices/all

(all disabled invoices)
GET /invoices/disabled

(all enabled invoices)
GET /invoices

(invoice by id)
GET /invoices/:id

(create invoice)
POST /invoices

(update invoice)
PUT /invoices/:id

(delete invoice)
DELETE /invoices/:id
```