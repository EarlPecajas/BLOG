# Project IDX Setup

This Django blog project is configured to run on Google Project IDX.

## Quick Start

1. The project will automatically install dependencies from `requirements.txt`
2. Run migrations:
   ```bash
   python manage.py migrate
   ```

3. Create a superuser:
   ```bash
   python manage.py createsuperuser
   ```

4. The preview server will start automatically on the configured port

## Features

- Django 5.2.9
- Django REST Framework
- SQLite Database
- Blog with CRUD operations
- Admin interface at `/admin`
- REST API at `/api/`

## URLs

- Home: `/`
- Admin: `/admin/`
- API: `/api/posts/`
