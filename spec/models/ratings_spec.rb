require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe 'relationships' do
    it { should belong_to :movie }
  end
end
