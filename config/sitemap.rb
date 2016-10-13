SitemapGenerator::Sitemap.default_host = "http://xn--m1aias.xn--p1ai"
SitemapGenerator::Sitemap.compress = false # :all_but_first

SitemapGenerator::Sitemap.create do
  add about_path
  add faq_path
  add contact_path

  add services_path, priority: 0.7, changefreq: 'daily'
  %w(certification accreditation development).each do |service|
    add service_path(service)
    case service
      when 'accreditation'
        %w(expert agency laboratory competence).each do |item|
          add item_service_path(service, item)
        end
    end
  end

  add partners_path, priority: 0.7, changefreq: 'daily'

  add articles_path, priority: 0.7, changefreq: 'daily'
  Article.find_each do |article|
    add article_path(article), lastmod: article.updated_at
  end
end
