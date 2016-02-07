#!/usr/bin/env ruby

user = ENV['USER']
home = "/home/#{user}"
wp_dir = File.join(home, ARGV.first || 'Pictures/Wallpapers')
wallpapers = Dir[File.join(wp_dir, '*')]
exec("feh --bg-fill #{wallpapers[rand(wallpapers.count)]}")

