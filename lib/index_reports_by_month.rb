require 'open-uri'
require 'nokogiri'

class IndexReportsByMonth

  MONTHLY_REPORT_LINK_XPATH = '//table/tbody/tr/td/font/a/@href'
  BASE_URL = 'http://nuforc.org/webreports/'

  def initialize(url)
    @url = url
  end

  def parse
    puts "Parsing url: #{@url}"
    doc = Nokogiri::HTML(open(@url))
    monthly_report_links = doc.xpath(MONTHLY_REPORT_LINK_XPATH)
    monthly_reports = monthly_report_links.map {|link|
      MonthlyReport.new("#{BASE_URL}#{link}")
    }

    monthly_reports
  end
end