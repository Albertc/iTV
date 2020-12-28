require 'rails_helper'

RSpec.describe Content, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:type) }
  it { should validate_presence_of(:plot) }
end
