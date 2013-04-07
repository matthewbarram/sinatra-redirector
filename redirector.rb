require 'sinatra'

# Here are some example redirects. The first matching redirect wins.

# GET /specific_path
get '/specific_path' do
  # Pass `, 301` for permanent redirects, but be warned: They can be cached
  # permanently, so you cannot fix typos.
  redirect "http://new-site.example.com/new_path"
end

# GET /post/42
get '/post/:id' do |post_id|
  redirect "http://new-site.example.com/blog/post/#{post_id}"
end

# GET /anything
get '*' do |path|
  # Note: `path` does not include query strings. You can use
  # env['REQUEST_URI'] etc. to get it.
  redirect "http://new-site.example.com#{path}"
end
