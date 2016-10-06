require 'sanitize'
require 'json'

class Incident

  MONTHLY_REPORT_LINK_XPATH = '//table/tbody/tr/td/font/a/@href'
  BASE_URL = 'http://nuforc.org/webreports/'

  attr_reader :url, :date_time, :city, :state, :shape, :duration, :summary, :posted_date, :description

  def initialize(url, date_time=nil, city=nil, state=nil, shape=nil, duration=nil, summary=nil, posted_date=nil, description=nil)
    @url = url
    @date_time = date_time
    @city = city
    @state = state
    @shape = shape
    @duration = duration
    @summary = summary
    @posted_date = posted_date
    @description = description
  end

  def parse
    puts "Parsing url: #{@url}"
    doc = Nokogiri::HTML(open(@url))

    @description = Sanitize.fragment(doc.xpath('//table/tbody/tr[2]/td/font').text)
  end

  def to_json
    JSON.generate({:url => @url, :date_time => @date_time, :city => @city, :state => @state, :shape => @shape, :duration => @duration, :summary => @summary, :posted_date => @posted_date, :description => @description})
  end
end
