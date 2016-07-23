require 'sinatra'

get '*' do |path|
  array_of_elements = env['REQUEST_URI'].split("/")
  puts array_of_elements
  @count = 0
  array_of_elements.each do |item|
    puts "#{item} - #{@count}"
    @count = @count + 1
  end
  if array_of_elements.count == 4
    redirect "https://101geo.myshopify.com/blog/101geo/#{url}"
  elsif array_of_elements == 2 || array_of_elements.first == "tag"
    url = array_of_elements.last
    redirect "https://101geo.myshopify.com/blog/101geo/tagged/#{url}"
  elsif array_of_elements == 2 || array_of_elements.first
    url = array_of_elements.first
    redirect "https://101geo.myshopify.com/blog/101geo/tagged/#{url}"
  else
    redirect "https://101geo.myshopify.com/blog/101geo/#{env['REQUEST_URI']}"
  end
end
