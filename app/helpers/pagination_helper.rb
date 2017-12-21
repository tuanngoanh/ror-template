module PaginationHelper
# Contains functionality shared by all renderer classes.
  class LinkRenderer < WillPaginate::ActionView::LinkRenderer


    def to_html
      list_items = pagination.map do |item|
        case item
        when Integer
          page_number(item)
        else
          send(item)
        end
      end.join(@options[:link_separator])
      tag('ul', list_items, :class => "pagination #{@options[:class]}")
    end


    def container_attributes
      super.except(*[:link_options])
    end

    protected

    def page_number(page)
      link_options = @options[:link_options] || {}
      if page == current_page
        tag :li, link(page, ""), :class => ('active')
      else
        tag :li, link(page, page, link_options.merge(:rel => rel_value(page)))
      end
    end


    def previous_or_next_page(page, text, classname)
      link_options = @options[:link_options] || {}
      if page
        tag :li, link(text, page, link_options), :class => classname
      else
        tag :li, link(text, ''), :class => '%s disabled' % classname
      end
    end


    def gap
      tag :li, tag('span', '&hellip;', 'data-container'=> 'body', 'data-toggle'=> 'popover', 'data-placement'=> 'top',
                   'data-content' => '
          <form method="get" accept-charset="UTF-8" action="" class="m-w-150">
            <input type="hidden" value="✓" name="utf8">
            <div class="input-group form-group-sm">
              <input type="text" placeholder="Page:" class="form-control col-sm-1" name="page">
              <span class="input-group-btn">
                <button type="submit" class="btn btn-default btn-sm">Go</button>
              </span>
            </div>
          </form>',
                   'data-html' => true), :class => ''
    end


    def previous_page
      num = @collection.current_page > 1 && @collection.current_page - 1
      previous_or_next_page(num, @options[:previous_label], 'arrow')
    end


    def next_page
      num = @collection.current_page < @collection.total_pages && @collection.current_page + 1
      previous_or_next_page(num, @options[:next_label], 'arrow')
    end


  end

  ##Render willpaginate with ajax (remote: true)
  class LinkRendererAjax < WillPaginate::ActionView::LinkRenderer
    def to_html
      list_items = pagination.map do |item|
        case item
        when Integer
          page_number(item)
        else
          send(item)
        end
      end.join(@options[:link_separator])
      tag("ul", list_items, :class => "pagination #{@options[:class]}")
    end


    def container_attributes
      super.except(*[:link_options])
    end


    protected

    def page_number(page)
      link_options = @options[:link_options] || {}
      if page == current_page
        tag :li, link(page, ""), :class => ('active')
      else
        tag :li, link(page, page, link_options.merge(:rel => rel_value(page), 'data-remote'=>true))
      end
    end


    def previous_or_next_page(page, text, classname)
      link_options = @options[:link_options] || {}
      if page
        tag :li, link(text, page, link_options.merge('data-remote'=> true)), :class => classname
      else
        tag :li, link(text, ''), :class => '%s disabled' % classname
      end
    end


    def gap
      tag :li, tag('span', '&hellip;', 'data-container'=> 'body', 'data-toggle'=> 'popover', 'data-placement'=> 'top',
                   'data-content' => '
          <form method="get" data-remote="true" accept-charset="UTF-8" action="" class="m-w-150">
            <input type="hidden" value="✓" name="utf8">
            <div class="input-group">
              <input type="text" placeholder="Page:" class="form-control" name="page">
              <span class="input-group-btn">
                <button type="submit" class="btn btn-default btn-sm">Go</button>
              </span>
            </div>
          </form>',
                   'data-html' => true), :class => ''
    end


    def previous_page
      num = @collection.current_page > 1 && @collection.current_page - 1
      previous_or_next_page(num, @options[:previous_label], 'arrow')
    end

    def next_page
      num = @collection.current_page < @collection.total_pages && @collection.current_page + 1
      previous_or_next_page(num, @options[:next_label], 'arrow')
    end

  end
end