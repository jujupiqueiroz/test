class Task < ActiveRecord::Base
	belongs_to :user
	belongs_to :project
	
	def self.search(search, page)
	    paginate :per_page => 10, :page => page, 
	    :conditions => ['name like ?', "%#{search}%"],:order => 'name'
	end

end
