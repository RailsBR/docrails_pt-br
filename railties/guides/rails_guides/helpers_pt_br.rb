module RailsGuides
  LIGHTHOUSE_PROJECT_PATH = "http://railsguides-pt_br.lighthouseapp.com/projects/19768/tickets/"
  module HelpersPtBR
    def guide_pt_br(name, url, options = {}, &block)
      link = content_tag(:a, :href => url) { name }
      result = content_tag(:dt, link)

      if ticket = options[:ticket]
        result << content_tag(:dd, lh(ticket), :class => 'ticket')
      end

      if translation_ticket = options[:translation_ticket]
        result << content_tag(:dd, lh_translation(translation_ticket), :class => 'ticket')
      end

      if revision_ticket = options[:revision_ticket]
        result << content_tag(:dd, lh_revision(revision_ticket), :class => 'ticket')
      end

      result << content_tag(:dd, capture(&block))
      concat(result)
    end

    def lh_translation(id, label = "Ticket no Lighthouse para a tradução")
      url = "#{LIGHTHOUSE_PROJECT_PATH}#{id}"
      content_tag(:a, label, :href => url)
    end

    def lh_revision(id, label = "Ticket no Lighthouse para a revisão")
      url = "#{LIGHTHOUSE_PROJECT_PATH}#{id}"
      content_tag(:a, label, :href => url)
    end
    
  end
end
