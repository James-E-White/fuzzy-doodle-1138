require 'rails_helper'

RSpec.describe 'mechanics show page' do
  describe 'as a user when I visit the mechanics show page' do
    it 'Shows the name, years of experience, and the name of the rides they are working on' do 
       amusement_park = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
       
       mechanic_1 = Mechanic.create!(name: "Jim", years_of_experience: 22)
       mechanic_2 = Mechanic.create!(name: "Norm", years_of_experience: 30)
       ride_1 = mechanic_1.rides.create!(name: "Top Gun", thrill_rating: 10, open: true, amusement_park_id: amusement_park.id)
       ride_2 = mechanic_1.rides.create!(name: "Gravatron", thrill_rating: 8, open: true, amusement_park_id: amusement_park.id)
       ride_3 = mechanic_2.rides.create!(name: "Fast and the Furious", thrill_rating: 6, open: true, amusement_park_id: amusement_park.id)
       
       visit "mechanics/#{mechanic_1.id}"

       expect(page).to have_content(mechanic_1.name)
       save_and_open_page
       expect(page).to have_content("Years of Experience: #{mechanic_1.years_of_experience}")
       expect(page).to have_content(ride_1.name)
       expect(page).to have_content(ride_2.name)
       expect(page).to_not have_content(mechanic_2.name)
       save_and_open_page
    end






  end
end 