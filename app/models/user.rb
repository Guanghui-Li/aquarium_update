class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :tanks, :dependent => :destroy
  has_many :livestocks, :dependent => :destroy
  has_many :colors, :dependent => :destroy
  has_many :species, :dependent => :destroy
  has_many :stock_types, :dependent => :destroy
  has_many :statuses, :dependent => :destroy
  has_many :memos, :dependent => :destroy
  has_many :histories, :dependent => :destroy
end
