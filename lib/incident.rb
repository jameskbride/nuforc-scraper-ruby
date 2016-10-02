require_relative 'index_reports_by_month'
require 'sanitize'
require 'json'

class Incident < IndexReportsByMonth

  attr_reader :url, :date_time, :city, :state, :shape, :duration, :summary, :posted_date, :description

  def initialize(url, date_time=nil, city=nil, state=nil, shape=nil, duration=nil, summary=nil, posted_date=nil, description=nil)
    super(url)
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
    doc = Nokogiri::HTML(open(@url))

    @description = Sanitize.fragment(doc.xpath('//table/tbody/tr[2]/td/font').text)
  end

  def to_json
    JSON.generate({:url => @url, :date_time => @date_time, :city => @city, :state => @state, :shape => @shape, :duration => @duration, :summary => @summary, :posted_date => @posted_date, :description => @description})
  end
end
