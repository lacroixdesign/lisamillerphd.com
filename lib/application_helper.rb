module ApplicationHelper

  # Display IcoMoon font icon
  def icon key
    "<i data-icon=&#x#{h(key)}></i>"
  end

  # Outputs markup for an SVG icon from the spritesheet
  #
  # @param name [String] the HTML ID of the SVG, minus the 'icon-' prefix
  # @param title [String] an accessibility title for screen readers
  #
  # @example The shopping bag icon with a title for visually impaired users
  #   svg_icon('bag', 'Your Shopping Cart')
  #
  # @return [ActiveSupport::SafeBuffer] the HTML content
  #
  def svg_icon(name, title = nil)
    options = {
      class: "svgicon-#{name}"
    }
    if title
      options[:role] = "img"
      options[:'aria-labelledby'] = "title"
    end

    svg = content_tag(:use, nil, {
      'xlink:href' => image_path("sprites/icons.svg#icon-#{name}")
    })

    content_tag(:svg, options) do
      if title
        content_tag(:title, title, { id: 'title' }) + svg
      else
        svg
      end
    end
  end

end
