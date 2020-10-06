class JazzStandardsController < ApplicationController

    get '/jazz-standards' do
        @user = current_user
        @standards = @user.jazz_standards
        erb :'/jazz_standards/index'
    end
end