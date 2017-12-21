class BootstrapBreadcrumbsLeftBuilder < BreadcrumbsOnRails::Breadcrumbs::Builder
  def render
    if @elements.size != 2
      @context.content_tag(:h1) do
        ['Dashboard', @context.content_tag(:small, 'Control panel')].join.html_safe
      end
    else
      @context.content_tag(:h1) do
        [@elements.first.name, @context.content_tag(:small, @elements.last.options[:title])].join.html_safe
      end
    end
   
  end

  def render_element(element, last = false)
    @context.content_tag(:li, :class => ('active' if last)) do
      if last
        link_or_text = compute_name(element)
      else
        link_or_text = @context.link_to(compute_name(element), compute_path(element), element.options)
      end

      divider = @context.content_tag(:span, (@options[:separator] || '').html_safe, :class => 'divider') unless last

      link_or_text + (last ? '' : (divider || ''))
    end
  end
end