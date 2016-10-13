class ArticleUploader < ApplicationUploader

  process :optimize
  process quality: 90
  process resize_to_limit: [800, 800]

  version :image do
    process :opaque
    process convert: 'jpg'
    process quality: 80
    process watertext: I18n.t('ncsc.name')
  end

  version :thumb do
    process :opaque
    process convert: 'jpg'
    process quality: 80
    process resize_to_fill: [192, 144]
  end

  version :icon do
    process :opaque
    process convert: 'jpg'
    process quality: 80
    process resize_and_pad: [96, 96, 'white']
  end

end
