class StageMailer < ApplicationMailer


  def stage_notify(model)
    @model = model

    mail(to: model.resource.agent.user.email,
         subject: %(#{model.resource.number}))
  end

end
