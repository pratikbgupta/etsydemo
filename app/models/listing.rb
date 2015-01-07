class Listing < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "default.jpg"
	else
		has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "https://dl.dropboxusercontent.com/1/view/5r96wemv8us0i6d/Apps/EtsyDemo2015/default/default.jpg",
					  :storage => :dropbox,
    				  :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    				  :path => ":style/:id_:filename"
    end
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates :image, :attachment_presence => true
	validates :name, :description, :price, presence: true
	validates :price, numericality: { greater_than: 0}

	#Association of listings to a user. 1 user to each listing
	belongs_to :user
end
