require 'spec_helper'

describe AlbumFoto, "model tests" do
  fixtures :album_fotos

  before(:each) do
    @album = AlbumFoto.new
    @album.user_id = "1"
    @album.title = "Paty Dance"
    @album.description = "We a happy..."    
  end

   it { should validate_uniqueness_of(:title).scoped_to(:user_id) }
   it { should validate_presence_of :title }
   it { should have_many :fotos }
   it { should belong_to :user }

  it "should be valid" do
    @album.should be_valid
  end

  it "should require title" do
  	@album.title = nil
  	@album.should_not be_valid
  	@album.errors.full_message(:title, 'is invalid').should_not be_nil
  end

  it "clears album_foto" do
    album_fotos(:one).destroy
    lambda { album_fotos(:one).reload }.should raise_error(ActiveRecord::RecordNotFound)
  end

  it "check of two model" do
  	@album.title = "MyFavoriteAlbum"
  	@album2 = AlbumFoto.new(:title => "Tripoli")
    @album3 = AlbumFoto.new(:title => "MyFavoriteAlbum")
    @album.title.should_not eq(@album2.title)
    @album.title.should eq(@album3.title)
  end

 it "check length of title" do 
 	@album.title = "MyFavoriteAlbum"
 	@album.title.should have(15).characters
 	@album.title.should_not have(19).characters
 end

 it "check include content" do
 	@album.title = "MyFavoriteAlbum"
 	@album.title.should include("iteA")
 	@album.description.should include("appy")
 	@album.title.should_not include("aaaa")
 	@album.description.should_not include("You")
 end

end
