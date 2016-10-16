require 'date'
require 'colorize'
class Blog
  def initialize
    @posts=[]
  end
  def add_post(post)
    @posts.push(post)
  end

  # def publish_front_page
  #   orden_post = @posts.sort do |post1, post2|
  #     post2.date <=> post1.date
  #   end
  #   orden_post.each do |post|
  #     puts post.title
  #     puts "*"* post.title.length
  #     puts post.text
  #     puts "-"* post.text.length
  #   end
  # end


  def publish_front_page
    numero_paginas = (@posts.length.to_f / 3).ceil
    # puts numero_paginas
    orden_post = @posts.sort do |post1, post2|
      post2.date <=> post1.date
    end
    contador_post = @posts.length

    indice = 1
    control = 1
    indexado = orden_post.map do |post|
      post.index = indice

      if  control >= 3
        indice += 1
        control = 1
      else
         control += 1
      end
      post
    end
    system("clear")
    for elemento in (0..2)
      puts indexado[elemento].title
      puts "*"* indexado[elemento].title.length
      puts indexado[elemento].text
      puts "-"* indexado[elemento].text.length
    end

    for snap in 1..numero_paginas
      print "   #{snap}    "
    end
    puts ""
    puts "Que pagina deseas ver ? "
    pagina = gets.chomp.to_i
    system("clear")
    while pagina != 0 do
      snapshot = indexado.select {|elemento| elemento.index == pagina}
      snapshot.each do |post|
         puts post.title
         puts "*"* post.title.length
         puts post.text
         puts "-"* post.text.length
      end
      for snap in 1..numero_paginas
        print "   #{snap}    "
      end
      puts ""
      puts "Que pagina deseas ver ? "
      pagina = gets.chomp.to_i
      system("clear")
    end


    # while contador_post < numero_post do
      #  puts indexado[4].title
      #  puts "*"* indexado[4].title.length
      #  puts "-"* indexado[4].text.length
      #  puts indexado[9].index
    #   contador_post += 1
    # end
  end

  # def print_page(page)
  #   snapshot = indexado.select {|elemento| elemento.index == page}
  #
  #   snapshot.each do |post|
  #      puts post.title
  #      puts "*"* post.title.length
  #      puts post.text
  #      puts "-"* post.text.length
  #   end
  # end
end

class Post
  attr_accessor :title, :date, :text, :index
  def initialize(title, date, text, index = "")
    @title = title
    @date = date
    @text = text
    @index = index
  end
end




class Post_Sponsored
  attr_accessor :title, :date, :text, :index
  def initialize(title, date, text, index = "")
    @title = ("*****")+title+("*****")
    @date = date
    @text = text
    @index = index
  end
end

blog = Blog.new

blog.add_post Post.new("Gabriel Garcia Marquez", Time.now, "Escritor Colombiano de la zona de la costa")

blog.add_post Post.new("Airton Senna Da Silva ", Time.now, "Corredor de coches Brasileño Varias veces Campeon del mundo")

blog.add_post Post.new("Ernest Heminway", Time.now, "Escritor y aventurero Americano, se suicidado")

blog.add_post Post.new("Magda Angel", Time.now, "Modelo Colombiana radicada en Estados unidos")

blog.add_post Post.new("Batman", Time.now, "Personaje de ficción, que proteje a la ciudad de Gotham")

blog.add_post Post.new("Homer Simpson", Time.now, "Dibujo animado cabeza de familia en los Simpson")

blog.add_post Post.new("REM", Time.now, "Grupo Musical uno de sus exitos es la canción losing my religion")

blog.add_post Post_Sponsored.new("Mariano Rajoy", Time.now, "Presidente en funciones de España")

blog.add_post Post_Sponsored.new("Naranjito", Time.now, "Mascota del Mundial España 82")

blog.add_post Post_Sponsored.new("Luis Briceño", Time.now, "Esta lloviendo Mucho")

blog.publish_front_page
