require_relative 'index_reports_by_month'

class Incident < IndexReportsByMonth

  attr_reader :url, :date_time, :city

  def initialize(url, date_time=nil, city=nil)
    super(url)
    @date_time = date_time
    @city = city
  end

  def parse
  end
end
