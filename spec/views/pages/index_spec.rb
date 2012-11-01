require 'spec_helper'

describe "pages/index.html.erb" do
  it "displays index page" do  	
    render
    expect(rendered).to include("Baner Site")
    expect(rendered).to include("Africa")
    expect(rendered).to include("Europe")
    expect(rendered).to include("Asia")
    expect(rendered).to include("Australia")  
  end
end

describe "pages/search.html.erb" do
  it "displays search page" do  	
    render
    expect(rendered).to include("<h1>Search</h1>")  	
  end
end

describe "pages/help.html.erb" do
  it "displays help page" do  	
    render
    expect(rendered).to include("<h1>Help</h1>")  	
    expect(rendered).to include("Tutorial1")  	
    expect(rendered).to include("Tutorial2")  	
    expect(rendered).to include("Tutorial3")  	
    expect(rendered).to include("Tutorial4")  	
  end
end

describe "pages/about.html.erb" do
  it "displays about page" do  	
    render
    expect(rendered).to include("About Us")  	
    expect(rendered).to include("<h2>Sections</h2>")  	
    expect(rendered).to include("<h2>Advertisement</h2>")  	
    expect(rendered).to include("News1. More")
  	expect(rendered).to include("Our Partners")
  	expect(rendered).to include("Authors")
  	expect(rendered).to include("Contacts")
  	expect(rendered).to include("Additional Information")
  end
end