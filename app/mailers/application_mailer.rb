class ApplicationMailer < ActionMailer::Base

  default to: '"NCSC" <mail@ncsc.msk.ru>'
  default from: '"NCSC" <default@ncsc.msk.ru>'
  default sender: '"NCSC" <default@ncsc.msk.ru>'

  default template_path: 'mailers'

  layout 'mailer'

end
