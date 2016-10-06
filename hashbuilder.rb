#!/usr/bin/env ruby
#hashbuilder - https://github.com/hatlord/hashbuilder
#Give me a plaintext value, and ill show you the hashes. You can also specify a salt!
#Example - ./hashbuilder --string password --salt 1234

require 'digest'
require 'colorize'
require 'text-table'
require 'trollop'

class Hashes

  attr_reader :hashes, :string
  
  def initialize
    @md5hashes    = []
    @sha1hashes   = []
    @sha256hashes = []
    @sha384hashes = []
    @sha512hashes = []
  end

  def arguments
    @@opts = Trollop::options do 
      version "hashbuilder 0.1b"

      opt :string, "String to hash", :type => String
      opt :salt, "Specify a salt to use against all strings", :type => String

      if ARGV.empty?
        puts "Need Help? Try ./hashbuilder.rb --help or -h"
      exit
      end
    end
  end

  def string
    @@opts[:string]
  end

  def header
    @md5hashes    << ['Hash Type', 'Hash Value']
    @sha1hashes   << ['Hash Type', 'Hash Value']
    @sha256hashes << ['Hash Type', 'Hash Value']
    @sha384hashes << ['Hash Type', 'Hash Value']
    @sha512hashes << ['Hash Type', 'Hash Value']
  end

  def md5
    @md5hashes << ["MD5 Hex", Digest::MD5.hexdigest(@@opts[:string])]
    @md5hashes << ["MD5 Base64", Digest::MD5.base64digest(@@opts[:string])]
      if @@opts[:salt]
        @md5hashes << ["MD5 Hex, prepend salt", Digest::MD5.hexdigest(@@opts[:salt] + @@opts[:string])]
        @md5hashes << ["MD5 Base64, prepend salt", Digest::MD5.base64digest(@@opts[:salt] + @@opts[:string])]
        @md5hashes << ["MD5 Hex, append salt", Digest::MD5.hexdigest(@@opts[:string] + @@opts[:salt])]
        @md5hashes << ["MD5 Base64, append salt", Digest::MD5.base64digest(@@opts[:string] + @@opts[:salt])]
      end
    @md5hashes
  end

  def sha1
    @sha1hashes << ["SHA1 Hex", Digest::SHA1.hexdigest(@@opts[:string])]
    @sha1hashes << ["SHA1 Base64", Digest::SHA1.base64digest(@@opts[:string])]
      if @@opts[:salt]
        @sha1hashes << ["SHA1 Hex, prepend salt", Digest::SHA1.hexdigest(@@opts[:salt] + @@opts[:string])]
        @sha1hashes << ["SHA1 Base64, prepend salt", Digest::SHA1.base64digest(@@opts[:salt] + @@opts[:string])]
        @sha1hashes << ["SHA1 Hex, append salt", Digest::SHA1.hexdigest(@@opts[:string] + @@opts[:salt])]
        @sha1hashes << ["SHA1 Base64, append salt", Digest::SHA1.base64digest(@@opts[:string] + @@opts[:salt])]
      end
      @sha1hashes
  end

  def sha256
    @sha256hashes << ["SHA256 Hex", Digest::SHA256.hexdigest(@@opts[:string])]
    @sha256hashes << ["SHA256 Base64", Digest::SHA256.base64digest(@@opts[:string])]
      if @@opts[:salt]
        @sha256hashes << ["SHA256 Hex, prepend salt", Digest::SHA256.hexdigest(@@opts[:salt] + @@opts[:string])]
        @sha256hashes << ["SHA256 Base64, prepend salt", Digest::SHA256.base64digest(@@opts[:salt] + @@opts[:string])]
        @sha256hashes << ["SHA256 Hex, append salt", Digest::SHA256.hexdigest(@@opts[:string] + @@opts[:salt])]
        @sha256hashes << ["SHA256 Base64, append salt", Digest::SHA256.base64digest(@@opts[:string] + @@opts[:salt])]
      end
      @sha256hashes
  end

  def sha384
    @sha384hashes << ["SHA384 Hex", Digest::SHA384.hexdigest(@@opts[:string])]
    @sha384hashes << ["SHA384 Base64", Digest::SHA384.base64digest(@@opts[:string])]
      if @@opts[:salt]
        @sha384hashes << ["SHA384 Hex, prepend salt", Digest::SHA384.hexdigest(@@opts[:salt] + @@opts[:string])]
        @sha384hashes << ["SHA384 Base64, prepend salt", Digest::SHA384.base64digest(@@opts[:salt] + @@opts[:string])]
        @sha384hashes << ["SHA384 Hex, append salt", Digest::SHA384.hexdigest(@@opts[:string] + @@opts[:salt])]
        @sha384hashes << ["SHA384 Base64, append salt", Digest::SHA384.base64digest(@@opts[:string] + @@opts[:salt])]
      end
      @sha384hashes
  end

  def sha512
    @sha512hashes << ["SHA512 Hex", Digest::SHA512.hexdigest(@@opts[:string])]
    @sha512hashes << ["SHA512 Base64", Digest::SHA512.base64digest(@@opts[:string])]
      if @@opts[:salt]
        @sha512hashes << ["SHA512 Hex, prepend salt", Digest::SHA512.hexdigest(@@opts[:salt] + @@opts[:string])]
        @sha512hashes << ["SHA512 Base64, prepend salt", Digest::SHA512.base64digest(@@opts[:salt] + @@opts[:string])]
        @sha512hashes << ["SHA512 Hex, append salt", Digest::SHA512.hexdigest(@@opts[:string] + @@opts[:salt])]
        @sha512hashes << ["SHA512 Base64, append salt", Digest::SHA512.base64digest(@@opts[:string] + @@opts[:salt])]
      end
      @sha512hashes
  end

end

class Printer

  def initialize(run)
    @run = run
  end

  def printhash
    puts "\nMD5 hashes for the string '#{@run.string}'".red.bold
      puts @run.md5.to_table(:first_row_is_head => true)
    puts "\nSHA1 hashes for the string '#{@run.string}'".red.bold
      puts @run.sha1.to_table(:first_row_is_head => true)
    puts "\nSHA256 hashes for the string '#{@run.string}'".red.bold
      puts @run.sha256.to_table(:first_row_is_head => true)
    puts "\nSHA384 hashes for the string '#{@run.string}'".red.bold
      puts @run.sha384.to_table(:first_row_is_head => true)
    puts "\nSHA512 hashes for the string '#{@run.string}'".red.bold
      puts @run.sha512.to_table(:first_row_is_head => true)
  end

end

run = Hashes.new
run.arguments
run.header

printme = Printer.new(run)
printme.printhash

