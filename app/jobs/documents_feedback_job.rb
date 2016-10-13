class DocumentsFeedbackJob < ApplicationJob

  def perform(*args)
    I18n.locale = I18n.default_locale
    Certificate.feedback
    Attestat.feedback
  end

end
