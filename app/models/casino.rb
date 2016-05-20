
class Casino < ActiveRecord::Base
  validates_inclusion_of :singleton_guard, :in => [0]

  has_many :rounds

  def self.instance
    begin
      first
    rescue ActiveRecord::RecordNotFound
      row = Casino.new
      row.singleton_guard = 0
      row.money = 10000000
      row.name = 'Nnodes'
      row.status = 'closed'
      row.interval = 3
      row.save!
    end
  end

  def start
    @running = true
  end

  def stop
    @running = false
  end

  def running
    return @running
  end

end
