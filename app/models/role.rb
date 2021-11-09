class Role < ActiveRecord::Base

    has_many :auditions

    def find_auditions
        self.auditions
    end

    def find_actors
        self.auditions.collect do |audition|
            audition.actor 
        end
    end

    def find_locations
        self.auditions.collect do |audition|
            audition.location
        end
    end

    def find_lead
        hired_first = self.auditions.find_by(hired: true)
        if  hired_first.nil?
            "no actor has been hired for this role"
        else
            hired_first
        end
    end

    def understudy
        hired_auditions = self.auditions.where("hired: 't'")
        if hired_auditions.length > 1
            hired_auditions[1]
        else
            "no actor has been hired for understudy for this role"
        end
end