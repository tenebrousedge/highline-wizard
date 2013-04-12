require 'highline/wizard'

include Highline::Wizard

OPTIONS = [
  %W( icecream chocolate extra-topping 4.5 ),
  %W( icecream chocolate no-topping 3.5 ),
  %W( cake chocolate no-topping 4.5 ),
  %W( cake vanilla no-topping 4.5 )
]

selected = wizzard(OPTIONS) do |q|
  q.titles = %w(desert flavor extra price)
end

puts selected.inspect

