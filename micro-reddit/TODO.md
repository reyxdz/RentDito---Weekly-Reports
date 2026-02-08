# Micro-Redgit Rails App - TODO List

## Step 1: User Model ✅
- [x] Generate User model with username and email
- [x] Run migration (migration created: 001_create_users.rb)
- [x] Add validations (presence, uniqueness, length)
- [ ] Test in console

## Step 2: Post Model ✅
- [x] Generate Post model with title, body, user_id
- [x] Run migration (migration created: 002_create_posts.rb)
- [x] Add validations
- [x] Set up associations (User has_many Posts)

## Step 3: Comment Model ✅
- [x] Generate Comment model with body, user_id, post_id
- [x] Run migration (migration created: 003_create_comments.rb)
- [x] Add validations
- [x] Set up associations (User has_many Comments, Post has_many Comments)

## Step 4: Console Testing
- [ ] Run migrations: `rails db:migrate`
- [ ] Create users: `rails c`
- [ ] Create posts
- [ ] Create comments
- [ ] Test associations

---

## Files Created:

### Migrations:
- `db/migrate/001_create_users.rb` - Creates users table with username and email
- `db/migrate/002_create_posts.rb` - Creates posts table with title, body, user_id
- `db/migrate/003_create_comments.rb` - Creates comments table with body, user_id, post_id

### Models:
- `app/models/user.rb` - User model with validations and associations
- `app/models/post.rb` - Post model with validations and associations
- `app/models/comment.rb` - Comment model with validations and associations

## Data Model Relationships:
- User has_many :posts
- User has_many :comments
- Post belongs_to :user
- Post has_many :comments
- Comment belongs_to :user
- Comment belongs_to :post

