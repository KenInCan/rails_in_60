class PagesController < ApplicationController
    def about
        @title = 'About us'
        @content = 'This is an about page'
    end
end
