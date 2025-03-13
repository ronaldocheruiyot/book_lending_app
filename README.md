# 📚 Book Lending App

A simple Ruby on Rails application for borrowing and returning books.

## 🚀 Features
- User authentication (Devise)
- List available books
- Borrow a book
- Return a book
- View borrowed books (User Profile)
- Borrowing history

## 🛠️ Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/your-username/book-lending-app.git
   cd book-lending-app
   ```

2. **Install dependencies:**
   ```sh
   bundle install
   ```

3. **Set up the database:**
   ```sh
   rails db:create db:migrate db:seed
   ```

4. **Start the server:**
   ```sh
   rails server
   ```

5. **Visit the app in your browser:**
   ```
   http://localhost:3000
   ```

## 📂 Project Structure
```
book-lending-app/
│── app/
│   ├── controllers/
│   │   ├── books_controller.rb
│   │   ├── borrowings_controller.rb
│   │   ├── users_controller.rb
│   ├── models/
│   │   ├── book.rb
│   │   ├── borrowing.rb
│   │   ├── user.rb
│   ├── views/
│   │   ├── books/
│   │   ├── borrowings/
│   │   ├── users/
│── config/
│── db/
│── Gemfile
│── README.md
```

## 📌 Routes
| Route | Method | Description |
|--------|--------|-------------|
| `/` | `GET` | Homepage with book list |
| `/books/:id` | `GET` | View book details |
| `/books/:id/borrow` | `POST` | Borrow a book |
| `/books/:id/return` | `POST` | Return a book |
| `/profile` | `GET` | View borrowed books |
| `/borrowings` | `GET` | View borrowing history |

## 🔧 Models
### **Book**
```ruby
class Book < ApplicationRecord
  has_many :borrowings
  has_many :users, through: :borrowings
  def available?
    borrowings.where(returned_at: nil).empty?
  end
end
```

### **Borrowing**
```ruby
class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book
end
```

### **User**
```ruby
class User < ApplicationRecord
  has_many :borrowings
  has_many :books, through: :borrowings
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
```

## 🎯 Contributing
Feel free to submit issues and pull requests to improve the project!

## 📜 License
This project is licensed under the MIT License.

---

Happy coding! 🚀
