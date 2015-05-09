helpers do
    def login(creator)
    session[:id] = creator.id
  end

  def logout
    session[:id] = nil
  end

  def logged_in?
    !current_creator.nil?
  end

  def current_creator
    @current_creator ||= Creator.find(session[:id]) if session[:id]
  end
end
