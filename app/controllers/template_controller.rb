#show all users
get '/templates' do
  @templates = Template.all
  erb :'templates/index'
end

#new template form
get '/templates/new' do
  if logged_in
    erb :'templates/new'
  else
    redirect '/templates'
  end
end

#create new template
post '/templates' do
  redirect '/sessions/new' if session[:id].nil?
  @new_template = Template.new(title: params[:title], body: params[:body], user_id: current_user.id)
  if @new_template.save
    redirect '/templates'
  else
    redirect '/templates/new'
  end
end

#get edit page
get '/templates/:id/edit' do
  @template = Template.find(params[:id])
  if allow_edit(@template)
    erb :'/templates/edit'
  else
    redirect "/templates/#{params[:id]}"
  end
end

#show a template
get '/templates/:id' do
  @template = Template.find(params[:id])
  erb :'/templates/show'
end

#submit template edit
put '/templates/:id' do
  @template = Template.find(params[:id])
  @template.update(body: params[:body], title: params[:title])
  redirect "templates/#{@template.id}"
end

#delete template
delete '/templates/:id' do
  @template = Template.find(params[:id])
  if allow_edit(@template)
    @template.destroy
    redirect "/templates"
  else
    redirect "/templates/#{params[:id]}"
  end
end
