class Song<ActiveRecord::Base
   validates :title,presence:true
   validates :artist_name,presence:true
   validate :release
   validates :artist_name,uniqueness:{scope: [:release_year,:title]}

   def release
     return true if !released
     if !release_year ||release_year>Date.today.year
       errors.add(:release_year," invalid release_year")
       return false
    end
  end

end
