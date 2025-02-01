require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square_view)

end

get("/square/new") do
  erb(:square_view)

end

get("/square/results") do
  @the_num = params.fetch("user_input").to_f
  @the_result = @the_num ** 2
  erb(:square_result)
end

get("/square_root/new") do
  erb(:sqroot_new)
end

get("/square_root/results") do
  @the_num = params.fetch("user_input").to_f
  @the_result = Math.sqrt(@the_num)
  
  erb(:sqroot_result)
end
