require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'Class methods' do
    describe '.average_age' do
      it 'can average the ages of all astronauts' do
        astro_1 = Astronaut.create(name: "Steve", age: 23, job: 'engineer')
        astro_2 = Astronaut.create(name: "Perry", age: 34, job: 'writer')
        astro_3 = Astronaut.create(name: "Carmichle", age: 54, job: 'technician')
        average = Astronaut.average_age

        expect(average).to eq(37)
      end
    end
  end
end
