class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  audited
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
