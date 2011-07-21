require 'rubygems'
['open-uri', 'hpricot', 'htmlentities'].each(&method(:require))

module Dtcrandom0
  class Application
    def run
      puts HTMLEntities.new.decode Hpricot(open('http://danstonchat.com/random0.html')).search('//div.item.item1/p.item-content[1]/a').html.gsub(/<\/?span[^>]*>/, '').gsub(/<br[^>]*>/, "\n")
    end
  end

  # singleton methods.
  class << self
    # Current Application
    def application
      @application ||= Dtcrandom0::Application.new
    end

    # Set the current application object.
    def application=(app)
      @application = app
    end
  end
end
