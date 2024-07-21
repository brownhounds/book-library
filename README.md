## Library App

[demo.webm](https://github.com/user-attachments/assets/33f1c32c-265a-419c-aa01-a2ee9aa3ac2a)

The repository consists of two components: `api` and the `frontend` app. More details can be found in the `README.md` of each specific component.

- [Backend](https://github.com/brownhounds/book-library/blob/main/api/README.md)
- [Frontend](https://github.com/brownhounds/book-library/blob/main/app/README.md)

### Run The Whole Stack

From the root of the project run `docker compose up` or `docker compose up --build --force-build`.

- **Frontend** will be served at: `http://127.0.0.1:3000/`
- **Api** will be served at: `http://127.0.0.1:8080/`
- **Api Docs** will be served at: `http://127.0.0.1:8080/docs`

### Tech Stack

1. Backend:

   - go (golang)
     - `go-swift` - very light abstraction on top of standard `http` library - [go-swift](https://github.com/brownhounds/swift)
     - `migoro` - database migrator supporting `Postgres/SQLite` - [migoro](https://github.com/brownhounds/migoro)
   - Postgres
   - OpenApi Request Validation
   - Api Swagger Documentation available at `http://api-host/docs`
   - Docker

2. Frontend:

   - Single Page App with Vue3
   - Vue router
   - Bootstrap 5
   - Typescript
   - SCSS
   - Docker

### Functional Requirements

- ✅ Ability to log in as a library admin or a reader
- ✅ Reader and Admin can view the list of books available in the library
- ✅ Reader can view the details of a book
- ✅ Reader can request a book
- ✅ Reader can see list of books and book requests
- ✅ Admin user can assign a book to a reader (when it’s “taken out”)
- ✅ Admin user can view the list of readers
- ✅ Admin user can view the details of a reader and books taken by them and pending requests
- ✅ Admin user can view list of book request
  - ✅ Admin user can approve request specifying return date
  - ✅ Admin user can mark book as returned
- ✅ App available on a public URL
  - API: [https://library-api.brownhounds.dev/](https://library-api.brownhounds.dev/)
  - API-DOCS: [https://library-api.brownhounds.dev/docs](https://library-api.brownhounds.dev/docs)
  - APP: [https://library.brownhounds.dev/](https://library.brownhounds.dev/)

### Live Preview

Application has been deployed to [https://library.brownhounds.dev/](https://library.brownhounds.dev/)

- Database Contains few users for testing purposes
- Database Contains 50 fake books

To login use user `email` and `password`.

**Users**

1. Admin:

   - `andreas.muller@test.com`

2. Readers:

   - `sophia.martinez@test.com`
   - `ethan.wilson@test.com`
   - `olivia.davis@test.com`
   - `michael.brown@test.com`
   - `emily.johnson@test.com`

### Disclaimers

1. This application uses JWT authentication tokens that are stored in local storage without an expiry date. Additionally, refresh tokens are not implemented, and there is no mechanism for token revocation. These decisions were made to expedite the development process for this exercise. As a result, the current authentication system lacks important security features typically recommended for production environments.

2. Data seeding is occurring during the main application migration process. This practice is not recommended and should be avoided in production environments.

3. When approving the handover of the book by the `admin`, the return date can be set in the past. This is intentional and expected in order to simulate expired books.
