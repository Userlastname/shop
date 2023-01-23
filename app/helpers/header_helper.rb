module HeaderHelper
  def current_link_class(path)
    current_page?(path) ? 'text-rose-500' : 'text-slate-50'
  end
end