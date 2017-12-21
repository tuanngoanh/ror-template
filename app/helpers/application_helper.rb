module ApplicationHelper
  def js_ready_tag funct
    content_for :js_ready do
      raw "<script>$(document).ready(function(){#{funct}})</script>"
    end
  end

  def js_tag funct
    raw "<script>#{funct}</script>"
  end

  def page_title(title)
    title.empty? ? COMPANY_NAME : "#{COMPANY_NAME} | #{title}"
  end
 
  def active(*controllers)
    controllers.try(:each) do |controller|
      return 'active' if (controller.include?(params[:controller]))
    end
  end

  def form_errors_for(object=nil)
    html = ''

    return html if object.errors.empty?

    errors_number = 0 

    html << "<ul class=\"#{object}_errors_list\">"

    saved_key = ""
    object.errors.each do |key, value|
      if key != saved_key
        html << "<li class=\"#{key} error\"> This #{key} #{value} </li>"
        errors_number += 1
      end
      saved_key = key
    end

    unsolved_errors = pluralize(errors_number, 'unsolved error')
    html = "<h4 class=\"#{object}_errors_title\"> You have #{unsolved_errors} </h4>" + html
    html << '</ul>'

    return html.html_safe
  end

  def s3_image_path(image_name)
    "https://#{AMAZON_S3_CONFIG[:BUCKET_NAME]}.s3.amazonaws.com/assets/images/#{image_name}"
  end

end
