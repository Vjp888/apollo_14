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
end
