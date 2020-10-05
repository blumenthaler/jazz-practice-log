class UsersController < ApplicationController

    get '/login' do
        erb :login
    end 

    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            binding.pry
            redirect "/users/#{@user.id}"
        else
            redirect '/login'
        end
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:user_id])
        erb :'users/show'
    end
end