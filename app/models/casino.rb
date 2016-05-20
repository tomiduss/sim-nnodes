
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

  def self.start
    instance.update(status: "open")
    return true
  end

  def self.stop
    instance.update(status: "closed")
    return false
  end

  def self.running
    return instance.status == "open" ? true : false
  end

  def self.interval
    return instance.interval
  end  

  private_class_method :new

end
