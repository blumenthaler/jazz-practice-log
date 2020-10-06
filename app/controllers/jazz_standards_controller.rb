class JazzStandardsController < ApplicationController

    get '/jazz-standards' do
        @standards = JazzStandard.all
        erb :'/jazz_standards/index'
    end
end