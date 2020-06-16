module ApplicationHelper
  def signedin?
    session[:user_id]!=nil
  end
end
