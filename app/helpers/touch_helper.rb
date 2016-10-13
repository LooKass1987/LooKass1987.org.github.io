module TouchHelper

  # Touch Events script
  def touchevents_script_tag
    content_tag :script do
      <<-JAVASCRIPT.squish.html_safe
      (function (w, d) {
        var t = w.ontouchstart || (w.DocumentTouch && d instanceof DocumentTouch);
        d.documentElement.className = 'js ' + (t ? 'touchevents' : 'no-touchevents');
      })(window, document)
      JAVASCRIPT
    end
  end

end
