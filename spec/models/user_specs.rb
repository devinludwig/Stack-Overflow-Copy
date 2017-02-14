require 'rails_helper'

describe User do
  it { should validate_presence_of :name }
  it { should validate_presence_of :username }
  it { should validate_presence_of :password_digest }
end
