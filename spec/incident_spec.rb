describe Incident do

  URL = 'http://nuforc.org/webreports/130/S130329.html'
  DATETIME = '9/29/16 23:30'
  CITY = 'Sanburg'
  STATE = 'NY'
  SHAPE = 'Oval'
  DURATION = '10 Minutes'
  SUMMARY = '3 orbs dancing/chasing each other in circles in Sanborn, NY. ((anonymous report))'
  POSTED_DATE = '9/30/16'

  it 'should have a url' do
    incident = Incident.new(URL)

    expect(incident.url).to eq(URL)
  end

  it 'can have a date/time' do
    incident = Incident.new(URL, DATETIME)

    expect(incident.date_time).to eq(DATETIME)
  end

  it 'can have a city' do
    incident = Incident.new(URL, DATETIME, CITY)

    expect(incident.city).to eq(CITY)
  end

  it 'can have a state' do
    incident = Incident.new(URL, DATETIME, CITY, STATE)

    expect(incident.state).to eq(STATE)
  end

  it 'can have a shape' do
    incident = Incident.new(URL, DATETIME, CITY, STATE, SHAPE)

    expect(incident.shape).to eq(SHAPE)
  end
  
  it 'can have a duration' do
    incident = Incident.new(URL, DATETIME, CITY, STATE, SHAPE, DURATION)

    expect(incident.duration).to eq(DURATION)
  end

  it 'can have a summary' do
    incident = Incident.new(URL, DATETIME, CITY, STATE, SHAPE, DURATION, SUMMARY)

    expect(incident.summary).to eq(SUMMARY)
  end

  it 'can have a posted date' do
    incident = Incident.new(URL, DATETIME, CITY, STATE, SHAPE, DURATION, SUMMARY, POSTED_DATE)

    expect(incident.posted_date).to eq(POSTED_DATE)
  end
  
  describe 'When parsing the incident' do

    ARBITRARY_URL = 'http://nuforc.org/webreports/ndxevent.html'

    before(:each) do
      path = File.expand_path File.join(File.dirname(__FILE__), 'incident_report.html')
      @incident_html = File::open(path)

      @incident_report = Incident.new(ARBITRARY_URL)
      expect(@incident_report).to receive(:open).with(ARBITRARY_URL).and_return(@incident_html)
      @incident_report.parse
    end

    after(:each) do
      @incident_html.close
    end

    it 'captures the incident description' do
      expect(@incident_report.description).to include('I was driving down a busy straight road when all of a sudden')
    end

    it 'strips html tags from the incident description' do
      expect(@incident_report.description).not_to include('<br>')
    end
  end
end