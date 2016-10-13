class ServicesController < ApplicationController

  before_action :read_local, only: :show

  def index
    @title = t 'service.index.title'
    @keywords = t 'service.index.keywords', default: ''
    @description = t 'service.index.description', default: ''
    @header = t 'service.index.header'
  end

  def show
    begin
      render params[:id]
    rescue ActionView::MissingTemplate
      raise ActionController::RoutingError.new "Service [#{params[:id]}] Not Found"
    end
  end

  def item
    begin
      render File.join 'services', params[:id], params[:item]
    rescue ActionView::MissingTemplate
      raise ActionController::RoutingError.new "Service [#{params[:id]}] Item [#{params[:item]}] Not Found"
    end
  end

  private

  def read_local
    case params[:id]
      when 'accreditation'
        @accreditation ||= YAML.load_file 'db/local/accreditation.yml'
    end
  end

end
