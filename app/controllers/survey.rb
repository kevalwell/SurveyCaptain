get '/survey/new' do
  erb :'/survey/new'
end

post '/survey/new' do
@survey =  Survey.create(params)

    redirect "/survey/#{@survey.id}/question/new"
end

