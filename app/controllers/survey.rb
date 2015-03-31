get '/survey/new' do
  erb :'/survey/new'
end

get '/survey/data/:id' do
  @cur_survey = Survey.find_by(id: params[:id])

  @questions = Question.where(survey_id: @cur_survey.id)
  @choices = Choice.where(survey_id: @cur_survey.id)

  erb :'survey/survey_data'
end


get '/survey/:id' do
  @cur_survey = Survey.find_by(id: params[:id])

  @questions = Question.where(survey_id: params[:id])
  @choices = Choice.where(survey_id: params[:id])

  erb :'survey/show_survey'
end

post '/survey/new' do
  @survey = Survey.create(params)
  @survey.user_id = current_user.id
  @survey.save

  if request.xhr?
    erb :'question/new', layout: false, locals: {survey: @survey}
  else
    redirect "/survey/#{@survey.id}/question/new"
  end
end

post '/response/new/survey/:id/' do

  @responses = []
  params[:response].each do |response|

    #response returns as array of variables whose values are choice_id's
      @responses << Response.create(survey_id: params[:id], choice_id: response[1])
  end

  redirect '/'
end

delete '/survey/data/:id' do
  cur_survey = Survey.find_by(id: params[:id])
  cur_survey.destroy
  redirect "/user/#{current_user.id}"
end
