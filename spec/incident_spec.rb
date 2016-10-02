describe Incident do

  URL = 'http://nuforc.org/webreports/130/S130329.html'
  DATETIME = '9/29/16 23:30'
  CITY = 'Sanburg'
  STATE = 'NY'
  SHAPE = 'Oval'
  DURATION = '10 Minutes'
  SUMMARY = '3 orbs dancing/chasing each other in circles in Sanborn, NY. ((anonymous report))'

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
end