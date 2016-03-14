module Monologue
  module HtmlHelper


    # +li+ tag with the 'active' class added if the url is the current one.
    # Eg.:
    #
    #   <%= activable_li_tag users_path do  %>
    #     <%= link_to "Users", users_path %>
    #   <% end %>
    #
    def activable_li_tag(*url, &block)
      content_tag :li, capture(&block), :class => ("active" if url.any?{|u| current_page?(u)})
    end

    # +li+ tag with the 'active' class added if the url is the current one with a link
    # inside it pointing to that url.
    #
    #   <%= activatable_li_tag_with_link "Users", users_path %>
    #
    def activable_li_tag_with_link(title, *url)
      activable_li_tag *url do
        link_to(title, url.first)
      end
    end

    def sidebar_section_for(title, &block)
       content_tag(:section, class: 'widget') do
         content_tag(:header, content_tag(:h1, title)) +
             capture(&block)
       end
     end
     
     def sidebar_icon_for(title)
    icon = case title
    when "Categories"
      icon('folder-open')
    when "Latest posts"
      icon('thumb-tack')
    when "Latest tweets"
      icon('twitter')
    when "Tags"
      icon('tags')
    end
    content_tag :h1 do
      icon + content_tag(:span, title)
    end
  end

  def sidebar_section_for(title, &block)
    content_tag(:section, class: 'widget') do
      content_tag(:header, sidebar_icon_for(title)) +
        capture(&block)
    end
  end

  end
end
