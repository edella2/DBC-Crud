#create new session page
get '/login' do
	erb :'/sessions/session_new'
end


#login to session
post '/sessions' do
	user = User.find_by(email: params[:email])
	if user && user.password = params[:password]
		session[:id] = user.id
		redirect '/'
	else
		# flash[:errors] = ['Incorrect Username or Password']
		status 400
		redirect '/login'
	end
end


#delete session
delete '/sessions/:id' do
	current_user = nil
	session[:id] = nil
	redirect '/templates'
end


