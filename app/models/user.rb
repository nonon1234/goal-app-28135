class User < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :division
    belongs_to_active_hash :position

    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
