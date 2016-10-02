require_relative 'index_reports_by_month'

class Incident < IndexReportsByMonth

  attr_reader :url, :date_time, :city, :state

  def initialize(url, date_time=nil, city=nil, state=nil)
    super(url)
    @date_time = date_time
    @city = city
    @state = state
  end
end
