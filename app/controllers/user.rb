get '/user/:id' do
  @cur_user = User.find_by(id: params[:id])
  erb :show_user
end

