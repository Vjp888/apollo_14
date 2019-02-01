require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do

  it 'shows astronauts information in index' do

    astro_1 = Astronaut.create(name: "Steve", age: 23, job: 'engineer')
    astro_2 = Astronaut.create(name: "Perry", age: 34, job: 'writer')
    astro_3 = Astronaut.create(name: "Carmichle", age: 54, job: 'technician')

    visit astronauts_path

    expect(page).to have_content(astro_1.name)
    expect(page).to have_content(astro_2.age)
    expect(page).to have_content(astro_3.job)

  end

  it "Shows average age of all astronauts on the page" do
    astro_1 = Astronaut.create(name: "Steve", age: 23, job: 'engineer')
    astro_2 = Astronaut.create(name: "Perry", age: 34, job: 'writer')
    astro_3 = Astronaut.create(name: "Carmichle", age: 54, job: 'technician')

    average = Astronaut.average_age

    visit astronauts_path

    expect(page).to have_content("Average age: 37")
  end

  it 'shows missions for each astronaut in alphabetical order' do
    astro_1 = Astronaut.create(name: "Steve", age: 23, job: 'engineer')
    astro_1.missions.create(title: "Apollo 13", time_in_space: 10)
    astro_1.missions.create(title: "Capricorn 4", time_in_space: 10)
    astro_1.missions.create(title: "Gemini 7", time_in_space: 10)

    visit astronauts_path

    within '.mission' do
      expect(page).to have_content("Apollo 13")
      expect(page).to have_content("Capricorn 4")
      expect(page).to have_content("Capricorn 7")
    end



  end
end
