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
      incidents << create_incident(doc, index)
      index += 1
    end

    incidents
  end

  def create_incident(doc, index)
    url = BASE_URL + doc.xpath("//table/tbody/tr[#{index}]/td/font/a/@href").text
    date_time = doc.xpath("//table/tbody/tr[#{index}]/td[1]/font/a").text
    city = doc.xpath("//table/tbody/tr[#{index}]/td[2]/font").text
    state = doc.xpath("//table/tbody/tr[#{index}]/td[3]/font").text
    shape = doc.xpath("//table/tbody/tr[#{index}]/td[4]/font").text
    duration = doc.xpath("//table/tbody/tr[#{index}]/td[5]/font").text
    Incident.new(url, date_time, city, state, shape, duration)
  end

end