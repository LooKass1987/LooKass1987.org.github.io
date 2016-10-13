class ArticlesController < ApplicationController

  def index
    @models = Article.published
    if index_params[:day]
      range = [
          index_params[:day],
          index_params[:month],
          index_params[:year]
      ].join ':'
      time = Time.new index_params[:year], index_params[:month], index_params[:day]
      @models = @models.where published_at: time.beginning_of_day..time.end_of_day
    elsif index_params[:month]
      range = [
          index_params[:month],
          index_params[:year]
      ].join ':'
      time = Time.new index_params[:year], index_params[:month]
      @models = @models.where published_at: time.beginning_of_month..time.end_of_month
    elsif index_params[:year]
      range = index_params[:year]
      time = Time.new index_params[:year]
      @models = @models.where published_at: time.beginning_of_year..time.end_of_year
    end
    @models = @models.page index_params[:page]

    @title = t 'article.index.title'
    @keywords = t 'article.index.keywords', default: ''
    @description = t 'article.index.description', default: ''
    @header = t 'article.index.header'

    unless range.blank?
      @title = "#{@title} [#{range}]"
      @description = "#{@description} [#{range}]"
      @header = "#{@header} <small>[#{range}]</small>"
    end

    page = index_params[:page].to_i
    if page > 1
      @title = "#{@title} # #{page}"
      @description = "#{@description} # #{page}"
    end

  end


  def show
    @model = Article.published.find show_params[:id]

    @title = @model.title.blank? ? @model.header : @model.title
    @keywords = @model.keywords
    @description = @model.description
    @header = @model.header
  end

  private

  def index_params
    params.permit :page, :year, :month, :day
  end

  def show_params
    params.permit :id
  end

end
