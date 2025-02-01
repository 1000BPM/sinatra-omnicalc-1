require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
  
end

get("/square/new") do
  erb(:square_view)

end

get("/square/results") do
  @the_num = params.fetch("user_input").to_f
  @the_result = @the_num ** 2
  erb(:square_result)
end
