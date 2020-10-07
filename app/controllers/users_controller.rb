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
        @user = User.new(params)
        if @user.save
            session[:user_id] = @user.id
            flash[:welcome] = "Wecome, "
            redirect "/users/#{@user.id}"
        else
            flash[:error] = "Please fill out all inputs to sign up: #{@user.errors.full_messages.to_sentence}"
            redirect "/signup"
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end
end