class Patient

    attr_accessor :name

    @@all = []

    def initialize (name)
        @name = name
        Patient.all << self
    end

    def self.all
        @@all
    end

    def new_appointment (doctor, appointment)
        Appointment.new(appointment, self, doctor)
    end

    def appointments
        Appointment.all.select do |appointment|
            appointment.patient == self
        end
    end

    def doctors
        appointments.map do|appointment|
            appointment.doctor
        end
    end

end