class JazzStandard < ActiveRecord::Base
    belongs_to :user
    validates :title, :composer, presence: true
end