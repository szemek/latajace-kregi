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

  namespace :colors do
    task update: :environment do
      circles = [
        {name: 'Kraków', color: '#f39e17'},
        {name: 'Warszawa', color: '#f4d03f'},
        {name: 'Trójmiasto', color: '#45b9a2'},
        {name: 'Śląsk', color: '#49d1b7'},
        {name: 'Tarnów', color: '#d35400'},
        {name: 'Poznań', color: '#2eb165'},
        {name: 'Łomianki', color: '#31cd73'},
        {name: 'Bochnia', color: '#c0392b'},
        {name: 'Berlin', color: '#c0392b'},
        {name: 'Wrocław', color: '#2980b9'},
        {name: 'Łódź', color: '#3498db'}
      ]

      circles.each do |circle|
        Circle.find_or_create_by(circle.slice(:name)).update_attributes(circle)
      end
    end
  end
end
