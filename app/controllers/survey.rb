get '/survey/new' do
  erb :'/survey/new'
end

get '/survey/:id' do
  @cur_survey = Survey.find_by(id: params[:id])
  erb :'survey/show_survey'
end

post '/survey/new' do
  @survey = Survey.create(params)

  if request.xhr?
    erb :'question/new', layout: false, locals: {survey: @survey}
  else
    redirect "/survey/#{@survey.id}/question/new"
  end
end

