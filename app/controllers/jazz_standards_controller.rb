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
        @standard = JazzStandard.create(
            title: params[:title],
            composer: params[:composer],
            recording: params[:recording],
            peformer: params[:performer],
            tempo: params[:tempo],
            levels_of_knowledge: params[:levels_of_knowledge],
            date_memorized: params[:date_memorized],
            user_id: current_user.id
            )
        redirect "/jazz-standards/#{@standard.id}"
    end

    get '/jazz-standards/:id' do
        @standard = JazzStandard.find_by(id: params[:id])
        erb :"/jazz_standards/show"
    end
end