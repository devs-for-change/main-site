# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def seed_image_path_prefix
  "#{Rails.root.to_s}/db/images"
end

FunFacts.destroy_all
FunFacts.create([
    {
      right_number: 13,
      text: 'extended family members',
      fun_fact_image: File.new("#{seed_image_path_prefix}/fun_facts/extended_family.png"),
    },
    {
      right_number: 106,
      text: 'years of professional experience',
      fun_fact_image: File.new("#{seed_image_path_prefix}/fun_facts/yrs_experience.png"),
    },
    {
      left_number: 7,
      right_number: 4,
      text: 'coffee to tea drinkers',
      fun_fact_image: File.new("#{seed_image_path_prefix}/fun_facts/coffee_tea.png"),
    },
    {
      left_number: 7,
      right_number: 5,
      text: 'star wars to star trek fans',
      fun_fact_image: File.new("#{seed_image_path_prefix}/fun_facts/wars_trek.png"),
    },
    {
      right_number: '2k',
      text: 'miles run this year',
      fun_fact_image: File.new("#{seed_image_path_prefix}/fun_facts/runner.png"),
    },
    {
      right_number: '10k',
      text: 'total tweets last time we checked',
      fun_fact_image: File.new("#{seed_image_path_prefix}/fun_facts/twitter.png"),
    },
  ])

def default_password
  if Rails.env.development?
    ENV['USER_SEED_PASSWORD'] || 'password123'
  else
    ENV.fetch('USER_SEED_PASSWORD') # Will raise exception if not provided.
  end
end

def get_profile_image_for(user)
  user_profile_image_path = "#{seed_image_path_prefix}/users/#{user[:first_name].downcase}_144.jpg"
  if File.exists?(user_profile_image_path)
    File.open(user_profile_image_path)
  else
    nil
  end
end

users = [
  {
    first_name: 'Nic',
    last_name: 'Boie',
    email: 'nic@devsforchange.org',
    profile_order: 1,
    title: 'Developer'
  },
  {
    first_name: 'JD',
    last_name: 'Guzman',
    email: 'jd@devsforchange.org',
    profile_order: 0,
    title: 'Developer'
  },
  {
    first_name: 'Bryant',
    last_name: 'Lippert',
    email: 'bryant@devsforchange.org',
    profile_order: 0,
    title: 'Developer'
  },
  {
    first_name: 'Richard',
    last_name: 'Hancock',
    email: 'richard@devsforchange.org',
    profile_order: 0,
    title: 'Developer'
  },
  {
    first_name: 'Brittany',
    last_name: 'Ledgerwood',
    email: 'brittany@devsforchange.org',
    profile_order: 9,
    title: 'Designer'
  },
  {
    first_name: 'Tony',
    last_name: 'Manning',
    email: 'tony@devsforchange.org',
    profile_order: 5,
    title: 'Project Manager'
  },
  {
    first_name: 'Haley',
    last_name: 'Luckeroth',
    email: 'haley@devsforchange.org',
    profile_order: 3,
    title: 'Information Architect'
  },
  {
    first_name: 'Katie',
    last_name: 'Nelson',
    email: 'katie@devsforchange.org',
    profile_order: 4,
    title: 'Project Manager'
  },
  {
    first_name: 'Angelene',
    last_name: 'Langeslay',
    email: 'angelene@devsforchange.org',
    profile_order: 6,
    title: 'Designer'
  },
  {
    first_name: 'Cindy',
    last_name: 'Schaller',
    email: 'cindy@devsforchange.org',
    profile_order: 2,
    title: 'Developer'

  },
  {
    first_name: 'Stuart',
    last_name: 'Loecker',
    email: 'stuart@devsforchange.org',
    profile_order: 7,
    title: 'Project Manager'
  },
  {
    first_name: 'Sarah',
    last_name: 'Bardwell',
    email: 'sarah@devsforchange.org',
    profile_order: 8,
    title: 'Marketing'
  }
].map do |user|
  common = {
    password: default_password,
    password_confirmation: default_password,
    profile_image: get_profile_image_for(user)
  }
  user.merge(common)
end

users.each do |user|
  # If the user is new, assign all attributes, otherwise, just set the image.
  if (mongoid_user = User.where(email: user[:email]).first_or_initialize).new_record?
    mongoid_user.assign_attributes(user)
  else
    mongoid_user.assign_attributes(profile_image: user[:profile_image], profile_order: user[:profile_order], title: user[:title])
  end
  mongoid_user.save!
end
