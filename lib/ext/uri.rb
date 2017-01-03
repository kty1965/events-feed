module URI
  def without_query
    "#{scheme}://#{host}#{path}"
  end
end
