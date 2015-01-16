namespace :circles do
  namespace :positions do
    desc "set circles positions"
    task update: :environment do
      circles = Circle.order(:id)
      circles.each do |circle|
        circle.update_attribute(:position, circle.id)
      end
    end
  end
end
