get '/' do
  @surveys = Survey.all
  erb :homepage
end
