Example:

#Model
#Blog --> belongs to student
#Student --> has many blogs

#Get all blogs
blogs = Blogs.all
blogs.each do |blog|
  blog.student.email
end

# Eager Loading

@blogs = Blog.includes(:student)

# Russian doll caching
<% @blogs.each do |blog| %>
  <% cache blog do %>
    <%= render blog %>
  <% end %>
<% end %>

# Use strict_loading

class Student < ApplicationRecord
  has_many :blogs, strict_loading: true
end

# counter_cache

class Student < ApplicationRecord  
  has_many :blogs, counter_cache: true
end

# To do this, we can just add a new column to the student table named blogs_count.

create_table :student do |t|
  # [Rest of the columns]
  t.integer :blogs_count, default: 0
end