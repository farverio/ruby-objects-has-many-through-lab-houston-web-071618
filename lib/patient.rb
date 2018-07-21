class Patient

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def new_appointment(doctor, date)
    Appointment.new(date, self, doctor)
  end

  def appointments
    Appointment.all.select do |appointment_obj|
      appointment_obj.patient == self
    end
  end

  def doctors
    self.appointments.map do |appointment_obj|
      appointment_obj.doctor
    end
  end
end
