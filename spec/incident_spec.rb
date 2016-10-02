describe Incident do

  ARBITRARY_INCIDENT_URL = 'http://nuforc.org/webreports/130/S130329.html'

  it 'should have a url' do
    incident = Incident.new(ARBITRARY_INCIDENT_URL)

    expect(incident.url).to eq(ARBITRARY_INCIDENT_URL)
  end

  it 'can have a date/time' do
    incident = Incident.new(ARBITRARY_INCIDENT_URL, '9/29/16 23:30')

    expect(incident.date_time).to eq('9/29/16 23:30')
  end

  it 'can have a city' do
    incident = Incident.new(ARBITRARY_INCIDENT_URL, '9/29/16 23:30', 'Sanburg')

    expect(incident.city).to eq('Sanburg')
  end

  it 'can have a state' do
    incident = Incident.new(ARBITRARY_INCIDENT_URL, '9/29/16 23:30', 'Sanburg', 'NY')

    expect(incident.state).to eq('NY')
  end

  it 'can have a shape' do
    incident = Incident.new(ARBITRARY_INCIDENT_URL, '9/29/16 23:30', 'Sanburg', 'NY', 'Oval')

    expect(incident.shape).to eq('Oval')
  end
end