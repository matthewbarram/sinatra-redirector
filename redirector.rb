require 'sinatra'

# Here are some example redirects. The first matching redirect wins.

# GET /specific_path
get '/specific_path' do
  redirect "http://new-site.example.com/new_path"
end

# GET /post/42
get '/post/:id' do
  redirect "http://new-site.example.com/blog/post/#{params[:id]}"
end

# GET /anything
get '*' do |path|
  # REQUEST_URI includes the query string (?foo=bar).
  full_path = env['REQUEST_URI']

  # Pass `, 301` for permanent redirects, but be warned: They can be cached
  # permanently, so you cannot fix typos.
  redirect "http://new-site.example.com#{full_path}"
end
