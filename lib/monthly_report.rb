require_relative 'index_reports_by_month'

class MonthlyReport < IndexReportsByMonth

  DATE_TIME_XPATH = '//table/tbody/tr/td/font/a/innerHTML()'

  attr_reader :url

  def parse
    puts "Parsing url: #{@url}"
    doc = Nokogiri::HTML(open(@url))
    incident_links_count = doc.xpath(MONTHLY_REPORT_LINK_XPATH).length

    index = 1
    incidents = []
    while (index < incident_links_count) do
      url = BASE_URL + doc.xpath("//table/tbody/tr[#{index}]/td/font/a").text
      date_time = doc.xpath("//table/tbody/tr[#{index}]/td/font/a").text
      incidents << (Incident.new(url, date_time))
      index += 1
    end

    incidents
  end

end