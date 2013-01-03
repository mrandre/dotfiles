#! /usr/bin/env ruby

require 'yaml'
require 'fileutils'
require 'find'
require 'pp'

include FileUtils

SKIMMER_TRUNK_LOCATION = "https://svn.prvt.nytimes.com/svn/webapps/skimmer/trunk"
SOLO_TRUNK_LOCATION = "https://svn.prvt.nytimes.com/svn/webapps/solo/trunk"

def line (length=80)
	arr = []
	length.times { arr << "=" }
	arr.join("")
end

def banner (text)
	puts ""
	puts line
	puts text
	puts line
	puts ""
end

def note (text)
	puts "-- " + text
end

# 1. Check out skimmer
# 2. Check out solo
# 3. Determine doc root
# 4. Symlink solo and skimmer into docroot.

def main
	banner("Skimmer Setup")
	checkout_skimmer
	checkout_solo
	symlink_app(get_docroot)
end

def checkout_skimmer
	note "Checking out Skimmer"
	`svn co #{SKIMMER_TRUNK_LOCATION} skimmer`
end

def checkout_solo
	note "Checking out Solo"
	`svn co #{SOLO_TRUNK_LOCATION} solo`
end

def get_docroot
	locations = ["/Library/WebServer/Documents", "/var/www", "/var/www/html"]
	puts "Tell me where your docroot is."
	puts ""
	locations.each_with_index do | dir, index |
		puts "#{index + 1}. #{dir}"
	end
	puts ""
	puts "If it's somewhere else, type it in."
	
	docroot = STDIN.gets.strip!
	docroot = locations[docroot.to_i - 1] if locations[docroot.to_i - 1]

	note "Validating " + docroot

	begin
		cd docroot do
			note "Docroot is valid."
			break
		end
	rescue
		puts "Docroot #{pwd} not valid. Try again."
		get_docroot
	end
	note "Docroot set"
	docroot
end

def symlink_app(docroot)
	full_path = File.expand_path pwd
	note "Current Full path is " + full_path
	cd docroot do
		note "Symlinking Skimmer"
		system "ln -s #{full_path}/skimmer/active skimmer"
		note "Symlinking Solo"
		system "ln -s #{full_path}/solo/active solo"
	end
	note "App ready"
end

main




