require 'open-uri'
require 'nokogiri'
require_relative 'monthly_report'
require 'chronic'

class IndexReportsSince
  MONTHLY_REPORT_LINK_XPATH = '//table/tbody/tr/td/font/a'
  BASE_URL = 'http://nuforc.org/webreports/'

  def initialize(url, since_date)
    @url = url
    @since_date = Chronic.parse(since_date)
  end

  def parse
    puts "Parsing url: #{@url}"
    doc = Nokogiri::HTML(open(@url))
    monthly_report_links = doc.xpath(MONTHLY_REPORT_LINK_XPATH).select do |link|
      @since_date == Chronic.parse(link.text)
    end
    monthly_reports = monthly_report_links.map do |link|
      MonthlyReport.new("#{BASE_URL}#{link.attribute('href')}")
    end

    monthly_reports
  end
end