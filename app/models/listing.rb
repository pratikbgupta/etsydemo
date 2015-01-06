class Listing < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "default.jpg"
	else
		has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "https://dl-web.dropbox.com/get/Apps/EtsyDemo2015/default.jpg?_subject_uid=204443872&w=AABwKPYByihertktnClNV8WrcvVCX_ajfe9Q8nIA81ij0Q",
					  :storage => :dropbox,
    				  :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    				  :path => ":style/:id_:filename"
    end
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates :image, :attachment_presence => true
	validates :name, :description, :price, presence: true
	validates :price, numericality: { greater_than: 0}
end
