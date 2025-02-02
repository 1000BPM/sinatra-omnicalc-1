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

get("/random/new") do
  erb(:random_new)
end

get("/random/results") do
  erb(:random_result)
end

get("/payment/new") do
  
  erb(:payment_new)
end

get("/payment/results") do
  #convert APR for use in formula (decimal point and monthly)
  
  @the_apr = params.fetch("apr_user_input").to_f
  @monthly_apr = @the_apr / 100
  @monthly_apr = @monthly_apr / 12

  #need to make apr display as percent at the end; do NOT use for payment calculation
  @the_apr = @the_apr.to_fs(:percentage,{:precision => 4})

  @the_yr = params.fetch("yr_user_input").to_i
  @the_months = @the_yr * 12

  @the_princ = params.fetch("pr_user_input").to_f
  @the_princ_formatted = @the_princ.to_fs(:currency)
  
  @numerator = @monthly_apr * @the_princ
  @denominator = 1 + @monthly_apr
  @denominator = @denominator**(-1* @the_months)
  @denominator = 1 - @denominator
  @the_result = @numerator / @denominator
  @the_result = @the_result.to_fs(:currency)
  
  erb(:payment_result)
end
