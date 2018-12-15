module ApplicationHelper
  def flash_message
    messages = ""
    [:notice, :info, :warning, :error].each {|type|
      if flash[type]
        messages += "<div class=\"#{type}\">#{flash[type]}</div>"
      end
    }

    messages.html_safe
  end
end
