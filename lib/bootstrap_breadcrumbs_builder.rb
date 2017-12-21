class BootstrapBreadcrumbsBuilder < BreadcrumbsOnRails::Breadcrumbs::Builder
  def render
    @context.content_tag(:ol, :class => 'breadcrumb') do
      elements_count = @elements.size
      i = 0
      @elements.collect do |element|
        i += 1
        render_element(element, last = (i == elements_count))
      end.join.html_safe
    end
  end

  def render_element(element, last = false)
    @context.content_tag(:li, :class => ('active' if last)) do
      if last
        link_or_text = compute_name(element)
      else
        link_or_text = @context.link_to(@elements.last.options[:title].present? ? @elements.last.options[:title] : compute_name(element),
                                        compute_path(element), element.options)
      end

      divider = @context.content_tag(:span, (@options[:separator] || '').html_safe, :class => 'divider') unless last

      link_or_text + (last ? '' : (divider || ''))
    end
  end
end