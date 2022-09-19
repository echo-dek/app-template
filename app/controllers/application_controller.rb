class ApplicationController < ActionController::Base
  helper_method :page_title

  protected

  def page_title
    "EchoDek App"
  end
end
