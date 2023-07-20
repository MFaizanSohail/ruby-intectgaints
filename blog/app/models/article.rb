class Article < ApplicationRecord
    after_create :print_created_data

    def print_created_data
        puts "User #{name} (#{email})"
    end

end
