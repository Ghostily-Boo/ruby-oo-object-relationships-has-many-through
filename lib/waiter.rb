require 'pry'

class Waiter
    attr_reader :name, :years

    def initialize(name, years)
        @name = name
        @years = years
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        tips = meals.map {|meal| meal.tip}
        max_tip = tips.max
        meals[tips.index(tips.max)].customer
    end
end