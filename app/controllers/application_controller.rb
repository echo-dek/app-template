class ApplicationController < ActionController::Base
  helper_method :page_title

  protected

  def page_title
    "EchoDek App"
  end

  def append_info_to_payload(payload)
    super
    payload[:request] = nil
    payload[:headers] = nil
    payload[:response] = nil
    payload[:app] = "EchoDek #{Rails.env}"
  end
end
