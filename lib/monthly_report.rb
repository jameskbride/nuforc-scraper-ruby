require_relative 'index_reports_by_month'

class MonthlyReport < IndexReportsByMonth

  attr_reader :url

  def parse
    puts "Parsing url: #{@url}"
    doc = Nokogiri::HTML(open(@url))
    monthly_report_links = doc.xpath(MONTHLY_REPORT_LINK_XPATH)
    incidents = monthly_report_links.map {|link|
      Incident.new("#{BASE_URL}#{link}")
    }

    incidents
  end

end