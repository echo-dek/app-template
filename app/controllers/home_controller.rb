class HomeController < ApplicationController
  def show
    render action: "show"
  end

  def health_check
    render action: "health_check"
  end
end
