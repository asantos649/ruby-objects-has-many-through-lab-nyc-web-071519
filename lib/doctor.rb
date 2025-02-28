class Doctor

    attr_accessor :name

    @@all = []

    def initialize (name)
        @name = name
        Doctor.all << self
    end

    def self.all
        @@all
    end

    def new_appointment (patient, appointment)
        Appointment.new(appointment, patient, self)
    end

    def appointments
        Appointment.all.select do |appointment|
            appointment.doctor == self
        end
    end

    def patients
        appointments.map do|appointment|
            appointment.patient
        end
    end

end