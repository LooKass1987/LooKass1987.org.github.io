ActiveAdmin.register Article do

  menu priority: 8, label: proc { I18n.t('active_admin.articles') }

  permit_params :published, :published_at,
                :banner, :header, :annotation, :content,
                :title, :keywords, :description

  scope :all, default: true
  scope :published
  scope :draft


  index do
    selectable_column
    id_column
    column :published, class: 'h-size--boolean'
    column :published_at, class: 'h-size--datetime'
    column :banner, class: 'h-size--image', sortable: false do |model|
      link_to admin_article_path(model) do
        imagic_tag model.banner.thumb,
                   class: 'img-thumbnail d-block m-x-auto',
                   width: 96,
                   height: 72
      end
    end
    column :header, class: 'h-size--20'
    column :annotation
    column :created_at
    actions
  end

  filter :published_at
  filter :header
  filter :annotation
  filter :content
  filter :updated_at
  filter :created_at

  batch_action :published, priority: 1 do |ids|
    batch_action_collection.find(ids).each do |model|
      model.update published: true unless model.published
    end
    redirect_to collection_path, alert: t('active_admin.batch_actions.alerts.published')
  end

  batch_action :unpublished, priority: 2 do |ids|
    batch_action_collection.find(ids).each do |model|
      model.update published: false if model.published
    end
    redirect_to collection_path, alert: t('active_admin.batch_actions.alerts.unpublished')
  end


  show do
    attributes_table do
      row :header
      row :annotation
      row :content do |model|
        div class: 'c-text--readable' do
          model.content.html_safe
        end unless model.content.blank?
      end
    end
    panel 'SEO' do
      attributes_table_for resource do
        row :title
        row :keywords
        row :description
      end
    end
    active_admin_comments
  end


  form do |f|
    f.semantic_errors *f.object.errors.keys
    tabs do
      tab 'Данные' do
        f.inputs do
          f.input :published, as: :select, include_blank: false,
                  input_html: {class: 'custom-select'}
          f.input :published_at, as: :datetime_picker
        end
        f.inputs do
          f.input :banner, as: :file,
                  input_html: {accept: f.object.banner.input_accept}
        end
        f.inputs do
          f.input :header
          f.input :annotation,
                  input_html: {class: 'h-js--autosize h-js--autosize--min',
                               rows: 3}
          f.input :content,
                  input_html: {class: 'h-js--redactor',
                               rows: 7}
        end
      end
      tab 'SEO' do
        f.inputs do
          f.input :title
          f.input :keywords
          f.input :description
        end
      end
    end
    f.actions
  end


  sidebar 'Публикация', only: :show do
    attributes_table_for resource do
      row :published
      row :published_at
    end
  end

  sidebar 'Баннер', only: [:show, :edit] do
    imagic_tag resource.banner,
               class: 'img-thumbnail d-block m-x-auto'
  end

  sidebar 'Статистика', only: [:show, :edit] do
    attributes_table do
      row :updated_at
      row :created_at
    end
  end

end
