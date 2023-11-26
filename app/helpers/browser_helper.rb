# frozen_string_literal: true

module BrowserHelper
  # Get browser name
  def client_browser_name
    if request.present? && request.env['HTTP_USER_AGENT'].present?
      user_agent = request.env['HTTP_USER_AGENT'].downcase
    end

    if user_agent =~ /msie/i
      'Internet Explorer'
    elsif user_agent =~ /konqueror/i
      'Konqueror'
    elsif user_agent =~ /chrome/i
      'Google Chrome'
    elsif user_agent =~ /gecko/i
      'Mozilla'
    elsif user_agent =~ /opera/i
      'Opera'
    elsif user_agent =~ /applewebkit/i
      'Safari'
    else
      user_agent
    end
  end

end