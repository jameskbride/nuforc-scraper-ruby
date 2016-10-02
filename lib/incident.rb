require_relative 'index_reports_by_month'

class Incident < IndexReportsByMonth

  attr_reader :url, :date_time, :city, :state, :shape, :duration, :summary

  def initialize(url, date_time=nil, city=nil, state=nil, shape=nil, duration=nil, summary=nil)
    super(url)
    @date_time = date_time
    @city = city
    @state = state
    @shape = shape
    @duration = duration
    @summary = summary
  end
end
