require 'sinatra'

get '*' do |path|
  array_of_elements = env['REQUEST_URI'].split("/")
  puts array_of_elements
  puts "numbers of elements in array #{array_of_elements.count}"
  @count = 0
  array_of_elements.each do |item|
    puts "#{item} - #{@count}"
    @count = @count + 1
  end
  if array_of_elements.count == 7
    url = array_of_elements[6]
    redirect "https://101geo.myshopify.com/blog/101geo/#{url}"
  elsif array_of_elements == 5 || array_of_elements.first == "tag"
    url = array_of_elements[4]
    redirect "https://101geo.myshopify.com/blog/101geo/tagged/#{url}"
  elsif array_of_elements == 5 || array_of_elements.first
    url = array_of_elements[3]
    redirect "https://101geo.myshopify.com/blog/101geo/tagged/#{url}"
  else
    redirect "https://101geo.myshopify.com/blog/101geo/#{env['REQUEST_URI']}"
  end
end
