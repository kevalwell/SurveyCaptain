get '/question/new/:id' do
  @survey = Survey.find_by(id: params[:id])
  erb :'/question/new'
end

post '/question/new/:id' do
    @question = Question.create(params)

end
