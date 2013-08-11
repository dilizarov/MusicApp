class User < ActiveRecord::Base
  attr_accessible :email, :password, :session_token, :activation_token, :admin

  has_many :notes,
  :class_name => 'Note',
  :foreign_key => :author_id,
  :primary_key => :id

end
