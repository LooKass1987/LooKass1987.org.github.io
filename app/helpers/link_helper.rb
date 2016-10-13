module LinkHelper

  # Link status class
  def link_status(path)
    if path == request.path && request.query_string.blank?
      'active'
    elsif path != '/' and request.path.index(path) == 0
      'parent'
    end
  end

end
