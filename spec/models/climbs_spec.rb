require 'rails_helper'

RSpec.describe Climb, type: :model do
    describe 'validations' do
        it { should validate_presence_of :name }
        it { should allow_value(true).for(:lead)}
        it { should allow_value(false).for(:lead)}
        it { should allow_value(true).for(:sport)}
        it { should allow_value(false).for(:sport)}
        it { should allow_value(true).for(:trad)}
        it { should allow_value(false).for(:trad)}
        it { should allow_value(true).for(:top_rope)}
        it { should allow_value(false).for(:top_rope)}
        it { should validate_presence_of :grade }
        it { should validate_presence_of :pitches }
    end

    describe 'relationships' do
        it {should belong_to :area }
    end
end