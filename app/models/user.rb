class User < ActiveRecord::Base
	acts_as_authentic
	has_many :projects
	has_many :tasks
 end
