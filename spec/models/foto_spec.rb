require 'spec_helper'

describe Foto, "model tests" do
  
  it { should belong_to :album_foto }
  it { should validate_presence_of :foto }
end
