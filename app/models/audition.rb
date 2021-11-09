class Audition < ActiveRecord::Base

    belongs_to :role
  
    def find_role
        self.role
    end

    def call_back
        self.hired = true
        self.save
    end

end