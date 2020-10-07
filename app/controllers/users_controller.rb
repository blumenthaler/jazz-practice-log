class UsersController < ApplicationController

    get '/login' do
        erb :'/users/login'
    end 

    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            flash[:welcome] = "Welcome, "
            redirect "/users/#{@user.id}"
        else
            flash[:error] = "Invalid username/password. Please try again."
            redirect '/login'
        end
    end

    get '/users/:id' do
        @user = current_user
        erb :'/users/show'
    end

    get '/signup' do
        erb :'/users/signup'
    end

    post '/users' do
        @user = User.create(params)
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}"
    end

    get '/logout' do
        session.clear
        redirect '/login'
    end
end