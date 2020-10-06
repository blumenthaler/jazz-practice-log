class JazzStandardsController < ApplicationController

    get '/jazz-standards' do
        @user = current_user
        @standards = @user.jazz_standards
        erb :'/jazz_standards/index'
    end

    get '/jazz-standards/:id' do
        @standard = JazzStandard.find_by(id: params[:id])
        erb :"jazz_standards/show"
    end
end