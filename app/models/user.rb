class User < ApplicationRecord

  has_many :comments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
   user_type == 'admin'
  end

  def author?
   user_type == 'author'
  end

  def reader?
   user_type == 'reader'
  end
end
