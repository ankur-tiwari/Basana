# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  creator_id  :integer          not null
#  team_id     :integer          not null
#  name        :string           not null
#  description :text
#  privacy     :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Project < ApplicationRecord

  validates :team, :creator, :name, presence: true
  validates :privacy, inclusion: { in: [true, false] }

  belongs_to :team

  belongs_to :creator,
    class_name: 'User',
    foreign_key: :creator_id

  has_many :tasks
end
