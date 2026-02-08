# Micro-Reddit Rails App

A simple Rails application demonstrating basic ActiveRecord models, validations, and associations.

## Data Models

### User
- **username**: string (unique, 3-50 chars, required)
- **email**: string (unique, valid format, required)
- **Associations**: has_many :posts, has_many :comments

### Post
- **title**: string (3-200 chars, required)
- **body**: text (minimum 10 chars, required)
- **user_id**: foreign key (required)
- **Associations**: belongs_to :user, has_many :comments

### Comment
- **body**: text (minimum 5 chars, required)
- **user_id**: foreign key (required)
- **post_id**: foreign key (required)
- **Associations**: belongs_to :user, belongs_to :post

## Setup Instructions

1. Navigate to the project directory:
   ```bash
   cd micro-reddit
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Run migrations:
   ```bash
   rails db:migrate
   ```

4. Open Rails console to test:
   ```bash
   rails c
   ```

## Console Testing Examples

```ruby
# Create users
u1 = User.create(username: 'john_doe', email: 'john@example.com')
u2 = User.create(username: 'jane_doe', email: 'jane@example.com')

# Check if user is valid
u = User.new
u.valid? # => false
u.errors.full_messages # Shows validation errors

# Create posts
p1 = u1.posts.build(title: 'First Post', body: 'This is the body of my first post')
p1.save

# Create comments
c1 = u2.comments.build(body: 'Great post!', post: p1)
c1.save

# Test associations
u1.posts # Returns all posts by user
p1.user # Returns the author (u1)
p1.comments # Returns all comments on post
c1.user # Returns the commenter (u2)
c1.post # Returns the post (p1)
```

## Project Structure

```
micro-reddit/
├── app/
│   └── models/
│       ├── user.rb
│       ├── post.rb
│       └── comment.rb
├── db/
│   └── migrate/
│       ├── 001_create_users.rb
│       ├── 002_create_posts.rb
│       └── 003_create_comments.rb
└── config/
    └── database.yml
```

## Validations

### User
- Username: presence, uniqueness, length 3-50
- Email: presence, uniqueness, valid format

### Post
- Title: presence, length 3-200
- Body: presence, minimum 10 characters

### Comment
- Body: presence, minimum 5 characters

