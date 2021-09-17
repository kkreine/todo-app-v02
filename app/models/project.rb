class Project < ApplicationRecord
  has_many :tasks
  belongs_to :user

  has_many :projects
  
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

  def status
    return 'not-started' if tasks.none?

    if tasks.all? { |task| task.complete? }
      'complete'
    elsif tasks.any? { |task| task.in_progress? || task.complete? }
      'in-progress'
    else
      'not-started'
    end
  end

  def percent_complete
    return 0 if tasks.none?

    complete_tasks = tasks.select { |task| task.complete? }.count
    ((complete_tasks.to_f / tasks.count) * 100).round
    
  end


end
