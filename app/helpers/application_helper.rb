module ApplicationHelper
  require 'redcarpet'
  require 'rouge'
  require 'rouge/plugins/redcarpet'

  class HTML < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet

    def block_code(code, language)
      Rouge.highlight(code, language || 'text', 'html')
    end
  end

  def markdown(text)
    render_options = {
    filter_html:     true,
    hard_wrap:       true, 
    link_attributes: { rel: 'nofollow' }
    }
    renderer = HTML.new(render_options)

    extensions = {
    autolink:           true,
    fenced_code_blocks: true,
    lax_spacing:        true,
    no_intra_emphasis:  true,
    strikethrough:      true,
    superscript:        true
    }
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end

  def first_200_characters(text)
    text[0..200]+"...\n..."
  end

  def admins_only(&block)
    block.call if current_user.try(:admin?)
  end

  def users_only(&block)
    block.call if current_user
  end

  def not_admin
    !current_user.try(:admin?)
  end

  def subscribed?
    current_user.try(:subscribed?)
  end
end
