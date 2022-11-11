class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable, :trackable, :lockable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true

  def full_name
    [first_name, last_name].join(" ")
  end
end
