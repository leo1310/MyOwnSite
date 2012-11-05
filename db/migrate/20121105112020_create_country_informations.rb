class CreateCountryInformations < ActiveRecord::Migration
  def up
    create_table :country_informations, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.integer :country_id
      t.timestamps
    end
  end
  def down
  	drop_table :country_informations
  end
end
