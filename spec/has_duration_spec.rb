require 'spec_helper'

describe Visit do
  
  # Asserts that singular and plural constructions can be used: 1.month, 44.years, etc.
  %w(year month week day hour minute second).each do |time|
    {1 => time, 44 => "#{time}s"}.each do |amount, duration|
      it "Serializes #{amount} #{duration}" do
        visit = Visit.create!(doctor: amount.send(duration))
        visit.reload
        visit.doctor.should == amount.send(duration)
      end
    end
  end
  
  it 'Skips validation for nil values' do
    Visit.new(doctor: 1.year, club: nil).should be_valid
  end

  it 'Works together with presence validator for nil values' do
    Visit.new.should_not be_valid
  end
  
  it 'Does not try to serialize non-durations' do
    visit = Visit.create!(doctor: 1.year)
    visit.update_attribute(:doctor, 'puts "something"')
    visit.doctor.should be_nil
  end

  it 'Does not try to deserialize invalid values' do
    visit = Visit.create!(doctor: 1.year)
    Visit.update_all('doctor = "blabla"')
    visit.reload
    visit.doctor.should be_nil
  end
end
