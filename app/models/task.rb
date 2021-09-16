class Task < ApplicationRecord
  belongs_to :project

  validates :status, inclusion: { in: ['not-started', 'in-progress', 'complete']}

  STATUS_OPTIONS = [
    ['not started', 'not-started'],
    ['in progress', 'in-progress'],
    ['complete', 'complete']]
end
