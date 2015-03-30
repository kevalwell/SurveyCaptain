get '/survey/:id/question/new' do
  @survey = Survey.find_by(id: params[:id])
  erb :'/question/new'
end

post '/survey/:id/question/new' do
    @question = Question.create(description: params[:description], survey_id: params[:id])
    @choice1 = Choice.create(option: params[:option1], question_id: @question.id)
    @choice2 = Choice.create(option: params[:option2], question_id: @question.id)
    @choice3 = Choice.create(option: params[:option3], question_id: @question.id)
    @choice4 = Choice.create(option: params[:option4], question_id: @question.id)
    redirect back
end
