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
        @standard = JazzStandard.new(
                title: params[:title],
                composer: params[:composer],
                recording: params[:recording],
                performer: params[:performer],
                tempo: params[:tempo],
                levels_of_knowledge: params[:levels_of_knowledge],
                date_memorized: params[:date_memorized],
                user_id: current_user.id
                )
        if @standard.save 
        # if params[:title] != "" etc etc    
            flash[:message] = "New Standard Created!"
            redirect "/jazz-standards/#{@standard.id}"
        else
            flash[:error] = "Please fill out all inputs to create a Standard"
            redirect '/jazz-standards/new'
        end
    end

    get '/jazz-standards/:id' do
        @standard = JazzStandard.find(params[:id])
        erb :"/jazz_standards/show"
    end

    get '/jazz-standards/:id/edit' do
        @standard = JazzStandard.find(params[:id])
        erb :"/jazz_standards/edit"
    end

    patch '/jazz-standards/:id' do
        @standard = JazzStandard.find(params[:id])
        @standard.update(
            title: params[:title],
            composer: params[:composer],
            recording: params[:recording],
            performer: params[:performer],
            tempo: params[:tempo],
            levels_of_knowledge: params[:levels_of_knowledge],
            date_memorized: params[:date_memorized]
            )
        redirect "/jazz-standards/#{@standard.id}"
    end

    delete '/jazz-standards/:id' do
        @standard = JazzStandard.find(params[:id])
        @standard.destroy
        redirect '/jazz-standards'
    end
end