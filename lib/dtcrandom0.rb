require 'rubygems'
['open-uri', 'hpricot', 'htmlentities'].each(&method(:require))

module Dtcrandom0
  class Application
    def run
      num = ARGV[0].to_i() - 1
      domain = 'http://danstonchat.com'
      url = domain + '/random0.html'
      page = Hpricot(open(url))
      page.search('//div.item')[0..num].each{|node|
        quote = node.search('//.item-content/a').html()
        permalink = node.search('//.item-meta//span//a')[0]&.get_attribute('href')
        puts " * %s : " % permalink
        puts HTMLEntities.new.decode quote.gsub(/<\/?span[^>]*>/, '').gsub(/<br[^>]*>/, '')
        puts
      }
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

