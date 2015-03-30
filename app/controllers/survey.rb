get '/survey/new' do
  erb :'/survey/new'
end

get '/survey/:id' do
  @cur_survey = Survey.find_by(id: params[:id])
  erb :'survey/show_survey'
end

post '/survey/new' do
@survey =  Survey.create(params)

    redirect "/question/new/#{@survey.id}"
end

