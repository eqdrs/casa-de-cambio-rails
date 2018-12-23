module ApplicationHelper
  def flash_message
    messages = ""
    [:notice, :info, :warning, :error].each {|type|
      if flash[type]
        messages += "<p><div class=\"#{type}\">#{flash[type]}</div></p>"
      end
    }

    messages.html_safe
  end
end
