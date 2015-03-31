get '/survey/new' do
  erb :'/survey/new'
end

get '/survey/data/:id' do
  @cur_survey = Survey.find_by(id: params[:id])
  erb :'survey/survey_data'
end


get '/survey/:id' do
  @cur_survey = Survey.find_by(id: params[:id])
  p @cur_survey
  @questions = Question.where(survey_id: params[:id])
  @choices = Choice.where(survey_id: params[:id])

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

post '/response/new/survey/:id/' do
  p params
  p params
  p params
  p params
  @questions = Question.where(survey_id: params[:id])
  @choices = Choice.where(survey_id: params[:id])

  @responses = []
  params.each do |response|
    response.each do |r|
     num = r.split('').last
      @responses << Response.create(survey_id: params[:id], choice_id: num.to_i)
    end
  end
  p @responses
  p @responses


  redirect '/'
end
