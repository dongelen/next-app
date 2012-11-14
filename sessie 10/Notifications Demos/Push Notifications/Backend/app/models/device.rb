class Device < ActiveRecord::Base
  attr_accessible :token, :uuid

  validates_presence_of :uuid
  validates_presence_of :token
end
