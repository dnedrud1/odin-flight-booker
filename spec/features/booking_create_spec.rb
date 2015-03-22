require 'rails_helper'


describe 'CreateBooking' do
  
  before do
    visit root_path
  end
  
  it 'should sucessfully create booking' do
    expect(current_path).to eq(root_path)
    select "NYC", :from => 'to_id'
    click_on('Search')
    choose('flight_id_1')
    click_on('Select Flight')
    
    page.should have_content "Complete Booking"
    expect{
      fill_in 'booking_passengers_attributes_0_name', with: "John"
      fill_in 'booking_passengers_attributes_0_email', with: "john@example.com"
      click_on('Submit Booking')
    }.to change(Booking,:count).by(1)
    
    page.should have_content "John"
  end
end