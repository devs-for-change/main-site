# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


FunFacts.destroy_all
FunFacts.create([
    {
      right_number: 13,
      text: 'extended family members',
      fun_fact_image: File.new("#{Rails.root.to_s}/db/images/extended_family.png"),
    },
    {
      right_number: 106,
      text: 'years of professional experience',
      fun_fact_image: File.new("#{Rails.root.to_s}/db/images/yrs_experience.png"),
    },
    {
      left_number: 7,
      right_number: 4,
      text: 'coffee to tea drinkers',
      fun_fact_image: File.new("#{Rails.root.to_s}/db/images/coffee_tea.png"),
    },
    {
      left_number: 7,
      right_number: 5,
      text: 'star wars to star trek fans',
      fun_fact_image: File.new("#{Rails.root.to_s}/db/images/wars_trek.png"),
    },
    {
      right_number: '2k',
      text: 'miles run this year',
      fun_fact_image: File.new("#{Rails.root.to_s}/db/images/runner.png"),
    },
    {
      right_number: '10k',
      text: 'total tweets last time we checked',
      fun_fact_image: File.new("#{Rails.root.to_s}/db/images/twitter.png"),
    },
  ])
