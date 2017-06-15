require "onebox"

Onebox::Engine::WhitelistedGenericOnebox.whitelist << "www.kaltura.com"

module Jekyll
  class OneboxP < Liquid::Tag
    def initialize(tag_name, text, tokens)
       super
       @text = text
    end
    
    def render(context)
      # pipe param through liquid to make additional replacements possible
      url = Liquid::Template.parse(@text).render context
	#url ="http://videos.kaltura.com/media/1_is3qd1az"
      # oembed look up
#print "HELLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLO\n" + context.to_s
#print "HELLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLO\n" + url
      preview = Onebox.preview(url) 
      "#{preview}"
	#print "ahhh" + "#{preview}"

    end
  end
end

Liquid::Template.register_tag('onebox', Jekyll::OneboxP)
