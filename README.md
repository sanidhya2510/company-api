# Company API

## Overview

Company API is a Ruby on Rails application that provides a robust API for managing company information. It includes features for retrieving a list of companies, viewing individual company details, and adding new companies. The API incorporates authentication and authorization for secure access.

## Features

- **List Companies**: Retrieve a list of companies with detailed information.
- **Company Details**: View detailed information for individual companies.
- **Add Companies**: Authenticated users with admin roles can add new companies.

## Getting Started

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/your-username/company-api.git
    cd company-api
    ```

2. **Install dependencies:**

    ```bash
    bundle install
    ```

3. **Set up the database:**

    ```bash
    rails db:create
    rails db:migrate
    ```

### Usage

Start the Rails server:

```bash
rails server

**API Endpoints:**

- **List Companies:** `GET /companies.json`
- **Company Details:** `GET /companies/:id.json`
- **Add Company:** `POST /companies.json` (Requires authentication and admin role)

**Authentication and Authorization:**

The API uses Devise for authentication. To authenticate, include the authentication token in the request header.

- **Admin Access:** Only users with the role 'admin' can add new companies.

**Error Handling:**

The API provides comprehensive error handling for various scenarios, including cases where a company is not found or when an invalid request is made (e.g., missing parameters). Detailed error responses are provided in JSON format.

**Testing:**

The project includes RSpec tests for various scenarios. Run the tests with:

```bash
bundle exec rspec
