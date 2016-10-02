require 'open-uri'
require 'nokogiri'
require_relative 'monthly_report'

class IndexReportsByMonth


  def initialize(url)
    @url = url
  end

  def parse
    puts "Parsing url: #{@url}"
    doc = Nokogiri::HTML(open(@url))
    monthly_report_links = doc.xpath("//table/tbody/tr/td/font/a/@href")
    puts monthly_report_links
    monthly_reports = monthly_report_links.map {|link|
      MonthlyReport.new("http://nuforc.org/webreports/#{link}")
    }

    monthly_reports
  end
end