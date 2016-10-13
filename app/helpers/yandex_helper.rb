module YandexHelper

  #Yandex Metrika script
  def yandex_metrika_script_tag
    if YANDEX[:metrika]
      content_tag :script do
        <<-JAVASCRIPT.squish.html_safe
        (function (w, c) {
          $(document).on('turbolinks:load', function () {
            (w[c] = w[c] || []).push(function () {
              try {
                w.yaCounter#{YANDEX[:metrika]} = new Ya.Metrika({
                  id: #{YANDEX[:metrika]},
                  clickmap: true,
                  trackLinks: true,
                  accurateTrackBounce: true,
                  webvisor: true,
                  trackHash: true
                });
              } catch (e) {
               }
            });
            $.ajax({
              url: '//mc.yandex.ru/metrika/watch.js',
              dataType: 'script',
              cache: true
            });
          });
        })(window, 'yandex_metrika_callbacks')
        JAVASCRIPT
      end
    end
  end

end
