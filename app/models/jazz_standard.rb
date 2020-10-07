class JazzStandard < ActiveRecord::Base
    belongs_to :user
    validates :title, :composer, :recording, :performer, :tempo, :levels_of_knowledge, :date_memorized, presence: true
end