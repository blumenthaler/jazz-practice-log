class JazzStandardsController < ApplicationController

    get '/jazz-standards' do
        @user = current_user
        @standards = @user.jazz_standards
        erb :'/jazz_standards/index'
    end

    get '/jazz-standards/new' do
        erb :'/jazz_standards/new'
    end

    post '/jazz-standards' do
        binding.pry
        @standard = JazzStandard.create(params)
        redirect "/jazz-standards/#{@standard.id}"
    end

    get '/jazz-standards/:id' do
        @standard = JazzStandard.find_by(id: params[:id])
        erb :"/jazz_standards/show"
    end
end