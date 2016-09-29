#!/usr/bin/env ruby
#hashbuilder

require 'digest'
require 'base64'
require 'colorize'
require 'text-table'
require 'trollop'

#take a string and output all the different hash types, then the base64 encoded versions.
#Maybe allow a user to specify a salt?
#read files of strings in or just single string?



class Hashes
  
  def initialize
    @strings = []
    @hashes = []
  end

  def arguments
    @@opts = Trollop::options do 
      version "hashbuilder 0.1b".light_blue

      opt :string, "String to hash", :type => String
      opt :strings, "File containing strings to hash", :type => String
      opt :salt, "Specify a salt to use against all strings", :type => String

      if ARGV.empty?
        puts "Need Help? Try ./hashbuilder.rb --help or -h"
      exit
      end
    end
  end

  def stringarray
    #build an array of strings to hash here.
    #This will allow single or multi string input
    #Do I want to do this? It could get messy really quickly!!
  end

  def header
    puts "Generating hashes for the string '#{@@opts[:string]}'".red
    @hashes << ['Hash Type', 'Hash Value']
  end

  def md5
    @hashes << ["MD5 Hex".green, Digest::MD5.hexdigest(@@opts[:string])]
    @hashes << ["MD5 with Base64".green, Digest::MD5.base64digest(@@opts[:string])]
      if @@opts[:salt]
        @hashes << ["MD5 Hex, prepend salt".light_blue, Digest::MD5.hexdigest(@@opts[:salt] + @@opts[:string])]
        @hashes << ["MD5 with Base64, prepend salt".light_blue, Digest::MD5.base64digest(@@opts[:salt] + @@opts[:string])]
        @hashes << ["MD5 Hex, append salt".light_blue, Digest::MD5.hexdigest(@@opts[:string] + @@opts[:salt])]
        @hashes << ["MD5 with Base64, append salt".light_blue, Digest::MD5.base64digest(@@opts[:string] + @@opts[:salt])]
    end
    @hashes
  end

  def sha1
    @hashes << ["SHA1 Hex".green, Digest::SHA1.hexdigest(@@opts[:string])]
    @hashes << ["SHA1 with Base64".green, Digest::SHA1.base64digest(@@opts[:string])]
      if @@opts[:salt]
        @hashes << ["SHA1 Hex, prepend salt".light_blue, Digest::SHA1.hexdigest(@@opts[:salt] + @@opts[:string])]
        @hashes << ["SHA1 with Base64, prepend salt".light_blue, Digest::SHA1.base64digest(@@opts[:salt] + @@opts[:string])]
        @hashes << ["SHA1 Hex, append salt".light_blue, Digest::SHA1.hexdigest(@@opts[:string] + @@opts[:salt])]
        @hashes << ["SHA1 with Base64, append salt".light_blue, Digest::SHA1.base64digest(@@opts[:string] + @@opts[:salt])]
    end
    @hashes
  end

  def sha256
    @hashes << ["SHA256 Hex".green, Digest::SHA256.hexdigest(@@opts[:string])]
    @hashes << ["SHA256 with Base64".green, Digest::SHA256.base64digest(@@opts[:string])]
      if @@opts[:salt]
        @hashes << ["SHA256 Hex, prepend salt".light_blue, Digest::SHA256.hexdigest(@@opts[:salt] + @@opts[:string])]
        @hashes << ["SHA256 with Base64, prepend salt".light_blue, Digest::SHA256.base64digest(@@opts[:salt] + @@opts[:string])]
        @hashes << ["SHA256 Hex, append salt".light_blue, Digest::SHA256.hexdigest(@@opts[:string] + @@opts[:salt])]
        @hashes << ["SHA256 with Base64, append salt".light_blue, Digest::SHA256.base64digest(@@opts[:string] + @@opts[:salt])]
      end
    @hashes
  end

  def sha384
    @hashes << ["SHA384 Hex".green, Digest::SHA384.hexdigest(@@opts[:string])]
    @hashes << ["SHA384 with Base64".green, Digest::SHA384.base64digest(@@opts[:string])]
  end

  def sha512
    @hashes << ["SHA512 Hex".green, Digest::SHA512.hexdigest(@@opts[:string])]
    @hashes << ["SHA512 with Base64".green, Digest::SHA512.base64digest(@@opts[:string])]
  end

end

class Printer
  #output everything here
end

run = Hashes.new
run.arguments
run.header

# puts run.md5.to_table(:first_row_is_head => true)
puts run.md5.to_table(:first_row_is_head => true)
puts run.sha1.to_table(:first_row_is_head => true)
puts run.sha256.to_table(:first_row_is_head => true)

printme = Printer.new


###CODE GRAVEYARD####
    # puts @hashes.to_table(:first_row_is_head => true)

