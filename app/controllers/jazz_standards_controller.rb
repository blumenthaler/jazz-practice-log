class JazzStandardsController < ApplicationController

    get '/jazz-standards' do
        if logged_in?
            @user = current_user
            @standards = @user.jazz_standards
            erb :'/jazz_standards/index'
        else
            flash[:error] = "You must be logged in to see your list"
            redirect '/login'
        end
    end

    get '/jazz-standards/new' do
        if logged_in?
            erb :'/jazz_standards/new'
        else
            flash[:error] = "You must be logged in to add a new Standard."
            redirect '/'
        end 
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
                notes: params[:notes],
                user_id: current_user.id
                )
        if @standard.save 
            flash[:message] = "New Standard Created!"
            redirect "/jazz-standards/#{@standard.id}"
        else
            flash[:error] = "Please fill out all inputs to create a Standard: #{@standard.errors.full_messages.to_sentence}"
            redirect '/jazz-standards/new'
        end
    end

    get '/jazz-standards/:id' do
        if logged_in?
            @standard = JazzStandard.find(params[:id])
            @user = current_user
            erb :"/jazz_standards/show"
        else
            flash[:error] = "You must be logged in to see this jazz standard."
            redirect '/login'
        end
    end

    get '/jazz-standards/:id/edit' do
        @standard = JazzStandard.find(params[:id])
        if authorized_to_edit?(@standard)
            erb :"/jazz_standards/edit"
        else
            flash[:error] = "You are not authorized to edit this User's Standard."
            redirect "/jazz-standards/#{@standard.id}"
        end
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
            date_memorized: params[:date_memorized],
            notes: params[:notes]
            )
        redirect "/jazz-standards/#{@standard.id}"
    end

    delete '/jazz-standards/:id' do
        @standard = JazzStandard.find(params[:id])
        @standard.destroy
        redirect '/jazz-standards'
    end
end