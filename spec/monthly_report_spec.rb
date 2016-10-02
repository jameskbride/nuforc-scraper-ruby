describe MonthlyReport do

  ARBITRARY_URL = 'http://nuforc.org/webreports/ndxevent.html'

  before(:each) do
    path = File.expand_path File.join(File.dirname(__FILE__), 'monthly_report.html')
    @index_reports_html = File::open(path)

    month_report = MonthlyReport.new(ARBITRARY_URL)
    expect(month_report).to receive(:open).with(ARBITRARY_URL).and_return(@index_reports_html)
    @incidents = month_report.parse
  end

  after(:each) do
    @index_reports_html.close
  end

  it 'should return a list of monthly reports' do
    expect(@incidents.length).to eq(528)
  end

  describe 'for each incident' do
    it 'should capture the url' do
      incident = @incidents[0]

      expect(incident.url).to eq('http://nuforc.org/webreports/130/S130329.html')
    end

    it 'should capture the date/time' do
      incident = @incidents[0]

      expect(incident.date_time).to eq('9/29/16 23:30')
    end

    it 'should capture the city' do
      incident = @incidents[0]

      expect(incident.city).to eq('Sanborn')
    end

    it 'should capture the state' do
      incident = @incidents[0]

      expect(incident.state).to eq('NY')
    end

    it 'should capture the shape' do
      incident = @incidents[0]

      expect(incident.shape).to eq('Oval')
    end

    it 'should capture the duration' do
      incident = @incidents[0]

      expect(incident.duration).to eq('10 minutes')
    end

    it 'should capture the summary' do
      incident = @incidents[0]

      expect(incident.summary).to eq('3 orbs dancing/chasing each other in circles in Sanborn, NY.  ((anonymous report))')
    end

    it 'should capture the posted date' do
      incident = @incidents[0]

      expect(incident.posted_date).to eq('9/30/16')
    end
  end

end