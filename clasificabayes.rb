require 'rubygems'
require 'stemmer'
require 'classifier'

linea_blanca= YAML::load_file('linea_blanca.yml')
aseo = YAML::load_file('aseo.yml')
perfumeria = YAML::load_file('perfumeria.yml')
cocina = YAML::load_file('cocina.yml')
ropa = YAML::load_file('ropa.yml')

classifier = Classifier::Bayes.new('linea_blanca', 'aseo', 'perfumeria', 'cocina','ropa')


linea_blanca.each { |linea_blanca| classifier.entrena_linea_blanca linea_blanca }
aseo.each { |aseo| classifier.entrena_aseo aseo }
perfumeria.each { |perfumeria| classifier.entrena_perfumeria perfumeria }
cocina.each { |cocina| classifier.entrena_cocina cocina }
ropa.each { |ropa| classifier.entrena_ropa ropa }


puts classifier.classify "playera tipo polo"


p classifier
