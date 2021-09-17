class Task < ApplicationRecord
  belongs_to :project

  validates :status, inclusion: { in: ['not-started', 'in-progress', 'complete']}

  STATUS_OPTIONS = [
    ['not started', 'not-started'],
    ['in progress', 'in-progress'],
    ['complete', 'complete']]

    def badge_color
      case status
      when 'not-started'
        'secondary'
      when 'in-progress'
        'info'
      when 'complete'
        'succes'
      end
    end

    def complete?
      status == 'complete'
    end

    def in_progress?
      status == 'in-progress'
    end

    def not_started?
      status == 'not-started'
    end
end
