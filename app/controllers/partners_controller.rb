class PartnersController < ApplicationController

  def index
    @models = Partner.published.page index_params[:page]

    @title = t 'partner.index.title'
    @keywords = t 'partner.index.keywords', default: ''
    @description = t 'partner.index.description', default: ''
    @header = t 'partner.index.header'

    page = index_params[:page].to_i
    if page > 1
      @title = "#{@title} # #{page}"
      @description = "#{@description} # #{page}"
    end
  end

  private

  def index_params
    params.permit :page
  end

end
