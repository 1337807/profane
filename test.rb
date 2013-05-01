require 'benchmark'
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'profane'

very_long_text = "Authentic PBR tofu selfies mcsweeney's, lo-fi cillum american apparel retro neutra +1 literally enim. 8-bit williamsburg pickled, tempor vinyl fap put a bird on it hoodie. Velit VHS mlkshk excepteur officia bespoke next level, biodiesel marfa vice selfies odd future 3 wolf moon umami street art. Bicycle rights enim wes anderson portland, plaid next level letterpress helvetica neutra twee fanny pack. Biodiesel minim VHS, assumenda fashion axe fanny pack shoreditch iphone salvia stumptown viral lomo fugiat. Leggings ugh brooklyn minim, assumenda seitan 3 wolf moon locavore blog wes anderson tonx pariatur echo park pop-up. Vice next level ea, terry richardson mcsweeney's neutra nisi jean shorts ugh non plaid.  Viral lomo raw denim mixtape tousled. Seitan plaid esse whatever portland. Cardigan tousled velit, 3 wolf moon photo booth seitan selfies disrupt trust fund do umami. Vero photo booth terry richardson anim excepteur, pug VHS pork belly cray. Eu enim reprehenderit, banh mi sint YOLO thundercats. Tumblr banh mi whatever irony, flannel blue bottle fashion axe veniam artisan selvage fingerstache williamsburg 90's hashtag craft beer. Skateboard non ennui echo park nulla fap.  Direct trade incididunt eu accusamus ethical, viral consequat YOLO gentrify do fingerstache occaecat blue bottle. PBR thundercats 8-bit laborum, banksy vinyl tousled ugh salvia stumptown echo park umami locavore mcsweeney's. Id exercitation sriracha banjo odio sed. Church-key quis officia exercitation, ut food truck ethnic keffiyeh hella vero 90's ethical carles. Beard pariatur placeat mlkshk vinyl hoodie. Ea do delectus deserunt officia sriracha brunch ad. Commodo food truck irony, trust fund YOLO tempor sapiente flannel.  Banh mi mustache literally, flannel 90's whatever godard chambray velit neutra ethical food truck carles. Non authentic cupidatat, bicycle rights stumptown fap irure keytar try-hard. American apparel placeat sriracha typewriter irony. Cupidatat eu stumptown, street art banh mi lomo iphone nulla umami four loko. Et deserunt hella brooklyn, aliqua fingerstache bespoke ethical pitchfork messenger bag. Hella wolf squid vero nesciunt leggings. Art party readymade shoreditch placeat, vegan tattooed cray delectus lo-fi 90's sunt gentrify four loko fanny pack in."
long_text = "Pinterest whatever ex, typewriter meh ullamco duis actually american apparel. Brunch +1 magna voluptate commodo church-key, carles nesciunt pariatur. High life nostrud locavore, direct trade art party fixie pariatur. Ea flannel wayfarers, carles messenger bag eiusmod jean shorts proident cray organic williamsburg you probably haven't heard of them cosby sweater laboris fap. Small batch cosby sweater artisan american apparel, 3 wolf moon vegan etsy sustainable ennui tattooed shoreditch. Semiotics dolore dolor bicycle rights four loko, godard umami eu flannel letterpress. Synth pop-up sustainable put a bird on it polaroid 90's, portland american apparel tonx sapiente."
alt_long_text = "Authentic PBR tofu selfies mcsweeney's, lo-fi cillum american apparel retro neutra +1 literally enim. 8-bit williamsburg pickled, tempor vinyl fap put a bird on it hoodie. Velit VHS mlkshk excepteur officia bespoke next level, biodiesel marfa vice selfies odd future 3 wolf moon umami street art. Bicycle rights enim wes anderson portland, plaid next level letterpress helvetica neutra twee fanny pack. Biodiesel minim VHS, assumenda fashion axe fanny pack shoreditch iphone salvia stumptown viral lomo fugiat. Leggings ugh brooklyn minim, assumenda seitan 3 wolf moon locavore blog wes anderson tonx pariatur echo park pop-up. Vice next level ea, terry richardson"
alt_short_text = "Authentic PBR tofu selfies mcsweeney's, lo-fi cillum american apparel retro neutra +1 literally enim. 8-bit williamsburg pickled, tempor vinyl fap put a bird on it hoodie. Velit VHS mlkshk excepteur officia bespoke"
short_text = "Pinterest whatever ex, typewriter meh ullamco duis actually american apparel. Brunch +1 magna voluptate commodo church-key, carles nesciunt pariatur. High life nostrud locavore, direct trade art party fixie pariatur."

n = 5000000000

filter = Profane::Filter.new
# GC.disable

Benchmark.bm do |x|
  x.report { filter.one_profane?(very_long_text) }
  x.report { filter.one_profane?(alt_long_text) }
  x.report { filter.one_profane?(alt_short_text) }
  puts 'two ***********************'
  x.report { filter.two_profane?(very_long_text) }
  x.report { filter.two_profane?(alt_long_text) }
  x.report { filter.two_profane?(alt_short_text) }
  puts 'three ***********************'
  x.report { filter.three_profane?(alt_long_text) }
  x.report { filter.three_profane?(very_long_text) }
  x.report { filter.three_profane?(short_text) }
  puts 'four ***********************'
  x.report { filter.four_profane?(very_long_text) }
  x.report { filter.four_profane?(alt_long_text) }
  x.report { filter.four_profane?(alt_short_text) }
  puts 'five ***********************'
  x.report { filter.five_profane?(very_long_text) }
  x.report { filter.five_profane?(alt_long_text) }
  x.report { filter.five_profane?(alt_short_text) }
end
