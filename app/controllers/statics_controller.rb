class StaticsController < ApplicationController

  before_action :read_local, only: :faq

  def home
    @side = 'right'
    @title = t 'static.home.title'
    @keywords = t 'static.home.keywords', default: ''
    @description = t 'static.home.description', default: ''
    @header = t 'static.home.header'
    @articles = Article.published.first 4
  end

  def about
    @schema = {page: 'AboutPage'}
    @side = 'right'
    @title = t 'static.about.title'
    @keywords = t 'static.about.keywords', default: ''
    @description = t 'static.about.description', default: ''
    @header = t 'static.about.header'
  end

  def faq
    @title = t 'static.faq.title'
    @keywords = t 'static.faq.keywords', default: ''
    @description = t 'static.faq.description', default: ''
    @header = t 'static.faq.header'
  end

  def control
    form = ControlForm.new(control_params)
    if form.valid?
      form.number = form.number.mb_chars.upcase
      model = Certificate.active.find_by(number: form.number) || Attestat.active.find_by(number: form.number)
      if model
        message = "#{model.class == Certificate ? 'Сертификат' : 'Аттестат'} № #{model.number}"
        if model.status > 0
          flash[:notice] = "#{message} действует..."
        else
          flash[:alert] = "#{message} не действует..."
        end
      else
        flash[:alert] = "Документ № #{form.number} не найден..."
      end
    else
      flash[:alert] = 'Ошибка ввода данных...'
    end
    redirect_back fallback_location: root_path
  end

  private

  def read_local
    case params[:action]
      when 'faq'
        @faq = YAML.load_file 'db/local/faq.yml'
    end
  end

  def control_params
    params.require(:control).permit :number
  end

end
