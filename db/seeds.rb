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
    title: 'Developer',
    biography: "I am a Ruby developer, working specifically with full stack Ruby on Rails applications. I co-founded Devs for Change out of a desire to use my professional experience to help other non-profits optimize their web presence, to teach and guide Jr. developers, and to learn from others on the team about areas outside of my specialty. I wrote my first program when I was 8, and wanted to be a programmer when I grew up."
  },
  {
    first_name: 'JD',
    last_name: 'Guzman',
    email: 'jd@devsforchange.org',
    profile_order: 0,
    title: 'Developer',
    biography: "Hello I'm JD, Software Artist. I co-founded Devs for Change out of a desire to propagate the idea that good software is like art. It takes skill, desire and determination to get it right. More than an organization for helping NPOs have better web sites, this is an extension of me wanting to help new developers learn the Art of writing code. I've been honing my craft for over 10 years and although far from a Zen Master I still believe I have much to impart to others!"
  },
  {
    first_name: 'Bryant',
    last_name: 'Lippert',
    email: 'bryant@devsforchange.org',
    profile_order: 0,
    title: 'Developer',
    biography: ''
  },
  {
    first_name: 'Richard',
    last_name: 'Hancock',
    email: 'richard@devsforchange.org',
    profile_order: 0,
    title: 'Developer',
    biography: 'Having been involved in IT and computer programming for over 20 years, as well as financial services for over a decade, I help found Devs For Change out of a passion for teaching and encouraging other to get involved in tech and grow their own skills. Providing mentorships to those getting started as well as a providing an avenue for up and coming designers and developers to hone their skills and get their own names out there.'
  },
  {
    first_name: 'Brittany',
    last_name: 'Ledgerwood',
    email: 'brittany@devsforchange.org',
    profile_order: 9,
    title: 'Designer',
    biography: "If I were to describe my design aesthetic with a font, it would be Print Clearly. It’s simple and to the point, but with a bit of spunk. I have a tremendous appreciation for art and design and have the pleasure of bringing those two things together in my day job. I co-founded Devs for Change out of a desire to help make the world a little bit brighter by doing what I do best - Design!"
  },
  {
    first_name: 'Tony',
    last_name: 'Manning',
    email: 'tony@devsforchange.org',
    profile_order: 5,
    title: 'Project Manager',
    biography: "I am User Experience Designer. I co-founded Devs for Change in order to help my community and grow my knowledge base in a field I was not an expert in. Websites, applications and content have always interested me, and like many people I enjoy finding ways to make them all fit together better. I have owned my own business for the last seven years and have 15 years of sales experience. DFC is my opportunity to reinvent myself and change my career path, I am getting on the job training and networking with other wonderful developers and designers. The best way to learn and expand your understanding is to surround yourself with great people that are passionate about what they do, and I love Devs for Change for that! I am interested in design, structure, strategy and graphic arts. I am eager to learn and grow, and Devs for Change is allowing me that opportunity."
  },
  {
    first_name: 'Haley',
    last_name: 'Luckeroth',
    email: 'haley@devsforchange.org',
    profile_order: 3,
    title: 'Information Architect',
    biography: "I love finding elegant solutions to complex problems, and the challenge of balancing strategic goals with user needs. My background in Graphic Design, Account Management and IT Project Management led me to a field I absolutely love, User Experience Design. I believe that technology has the power to spread knowledge and information that can improve lives, a belief that led me to volunteer as a computer tutor helping low income kids increase their digital literacy through Project for Pride in Living http://www.ppl-inc.org/. Through Devs for Change, I’m excited to help nonprofits improve their online experience and in turn help the communities they serve."
  },
  {
    first_name: 'Katie',
    last_name: 'Nelson',
    email: 'katie@devsforchange.org',
    profile_order: 4,
    title: 'Project Manager',
    biography: "If I had a superpower it would be organization. I guess it's lucky I fell into project management! During the day I am a PM for a fabulous interactive agency in St. Paul, MN. I've been enthusiastically managing interactive projects since 2006. I joined Devs for Change to share my passion and to give back to the community."
  },
  {
    first_name: 'Angelene',
    last_name: 'Langeslay',
    email: 'angelene@devsforchange.org',
    profile_order: 6,
    title: 'Designer',
    biography: "My name is Angelene and I am a designer. I dabble in a variety of design categories including web design, print design, search engine marketing, and a little front-end development. When I’m not designing, I enjoy traveling, playing soccer, and photography. I joined Devs for Change to collaborate with other like-minded people who want to use their talents to give back."
  },
  {
    first_name: 'Cindy',
    last_name: 'Schaller',
    email: 'cindy@devsforchange.org',
    profile_order: 2,
    title: 'Developer',
    biography: "I have been in the programming profession for almost 15 years. I first became interested in programming when the internet was just taking off. I was fascinated by the idea of being able to program something on a computer and send it out into the world with the press of a button.  That same excitement still motivates me today in many different areas of technology. I joined Devs for Change to spark that same excitement in others as they learn how powerful programming can be. I really enjoy every opportunity that I can get to support and motivate kids, especially girls, to get involved in technology. I have found that the more that I help educate others, the more that I learn in the process.  Let's learn together!"

  },
  {
    first_name: 'Stuart',
    last_name: 'Loecker',
    email: 'stuart@devsforchange.org',
    profile_order: 7,
    title: 'Project Manager',
    biography: "Always having a knack to be in the right place at the right time, I was and continue to be a career massage therapist who accidentally fell into the role of Project Manager. I like to come up with easy and sensible solutions to complex problems, whether it be personal rehabilitation or web-site rehabilitation. I have learned much while working alongside our members in the Devs for Change group, and look forward to passing this knowledge along to our clients!"
  },
  {
    first_name: 'Sarah',
    last_name: 'Bardwell',
    email: 'sarah@devsforchange.org',
    profile_order: 8,
    title: 'Marketing',
    biography: "I’ve been passionate about marketing since before I knew what the word for it was. After studying it in college, and then aside from a brief stint on sailing yachts, I have been working in marketing ever since. I’ve always found myself working for small companies and non-profits, helping to always create more with less, making gourmet projects from ramen-noodle budgets, and finding out-of-the-box solutions and ideas that are “so crazy they just might actually work”. I love sailing, teaching myself new things (most recently tiling), cooking, drinking wine, and discussing content marketing strategies. If I didn’t fall in love with marketing, I think I would be in politics...but aren’t they really the same thing?"
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
