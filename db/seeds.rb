# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create! YAML.load_file 'db/seeds/users.yml' if User.all.empty?
admin = User.all.find 1


YAML.load_file('db/seeds/articles.yml').each do |model|
  model[:published] = true
  Article.create! model
end if Article.all.empty?


YAML.load_file('db/seeds/partners.yml').each_with_index do |model, idx|
  model[:published] = true
  model[:index] = idx
  Partner.create! model
end if Partner.all.empty?


YAML.load_file('db/seeds/agents.yml').each do |model|
  model[:active] = true
  Agent.create! model
end if Agent.all.empty?


YAML.load_file('db/seeds/customers.yml').each do |model|
  model[:active] = true
  Customer.create! model
end if Customer.all.empty?


YAML.load_file('db/seeds/attestats.yml').each do |model|
  resumed_at = model.delete :resumed_at
  suspended_at = model.delete :suspended_at
  canceled_at = model.delete :canceled_at
  comment = model.delete :comment
  model[:active] = true
  model[:created_at] = Time.at model[:created_at]
  model[:updated_at] = Time.at model[:updated_at]
  model = Attestat.create! model
  if suspended_at != '0000-00-00'
    Stage.create! resource: model, operate: 'suspend', operate_at: suspended_at
  end
  if resumed_at != '0000-00-00'
    Stage.create! resource: model, operate: 'resume', operate_at: resumed_at
  end
  if canceled_at != '0000-00-00'
    Stage.create! resource: model, operate: 'cancel', operate_at: canceled_at
  end
  if !comment.blank?
    ActiveAdmin::Comment.create! resource: model, namespace: 'admin', author: admin, body: comment
  end
end if Attestat.all.empty?


YAML.load_file('db/seeds/certificate.yml').each do |model|
  resumed_at = model.delete :resumed_at
  suspended_at = model.delete :suspended_at
  canceled_at = model.delete :canceled_at
  comment = model.delete :comment
  model[:active] = true
  model[:created_at] = Time.at model[:created_at]
  model[:updated_at] = Time.at model[:updated_at]
  model = Certificate.create! model
  if suspended_at != '0000-00-00'
    Stage.create! resource: model, operate: '-', operate_at: suspended_at
  end
  if resumed_at != '0000-00-00'
    Stage.create! resource: model, operate: '+', operate_at: resumed_at
  end
  if canceled_at != '0000-00-00'
    Stage.create! resource: model, operate: '!', operate_at: canceled_at
  end
  if !comment.blank?
    ActiveAdmin::Comment.create! resource: model, namespace: 'admin', author: admin, body: comment
  end
end if Certificate.all.empty?


=begin
Stage.all.each do |model|
  case model.operate
    when 'resume'
      operate = '+'
    when 'suspend'
      operate = '-'
    when 'cancel'
      operate = '!'
    else
      operate = '@'
  end
  model.update operate: operate if model.operate != operate
end
=end
