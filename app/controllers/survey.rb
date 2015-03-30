get '/survey/new' do


  erb :'/survey/new'
end

post '/survey/new' do


  redirect '/survey/new'
end
