require 'rubygems'
require 'bundler/setup'
require 'nokogiri'

require "rspec"
require "../lib/matriz.rb"
require "../lib/racional.rb"

describe Matrices do
  before :each do

    @matrizden1 = Densa.new(3,3,[1,2,3,4,5,6,7,8,9])
    @matrizden2 = Densa.new(3,3,[1,2,3,4,5,6,7,8,9])

    
    @matrizfrac1 = Densa.new(3,3,[Racional.new(1,2),Racional.new(1,3),Racional.new(1,4),Racional.new(1,5),Racional.new(1,6),Racional.new(1,7),Racional.new(1,8),Racional.new(1,9),Racional.new(1,10)])
    @matrizfrac2 = Densa.new(3,3,[Racional.new(1,2),Racional.new(2,3),Racional.new(3,4),Racional.new(4,5),Racional.new(5,6),Racional.new(6,7),Racional.new(7,8),Racional.new(8,9),Racional.new(9,10)])

    @matrizdis1 = Dispersa.new(3,3,[0,1,2],[0,1,2],[1,2,3])
    @matrizdis2 = Dispersa.new(3,3,[0,1,2],[0,1,2],[1,2,3])

    
  end

######IMPLEMENTACIÓN NUEVA
describe "#Para acceder a elementos" do
    it "Comprobando que se creo."do
      @matrizden1.pos(0,0).should eq(1)
      @matrizden1.pos(1,1).should eq(5)
      @matrizden1.pos(2,2).should eq(9)
   end
end
########################################################
##########OPERACIONES CON FRACCIONES####################
########################################################
describe "#Operaciones con fracciones" do
	it "Suma fracciones" do
      (@matrizfrac1+@matrizfrac2).to_s.should eq("[[1/1, 1/1, 1/1], [1/1, 1/1, 1/1], [1/1, 1/1, 1/1]]")
        end
end
########################################################
#########OPERACIONES ENTRE MATRICES DENSAS##############
########################################################
describe "#Operaciones de matrices densas" do
    it "Suma de matrices densas" do
       (@matrizden1+@matrizden2).to_s.should eq("[[2, 4, 6], [8, 10, 12], [14, 16, 18]]")
    end
     it "Resta de matrices densas" do
        (@matrizden1-@matrizden2).to_s.should eq("[[0, 0, 0], [0, 0, 0], [0, 0, 0]]")
    end
end
########################################################
#########OPERACIONES ENTRE MATRICES DISPERSAS###########
########################################################
describe "#Operaciones de matrices dispersas" do
    it "Suma de matrices dispersas" do
       (@matrizdis1+@matrizdis2).to_s().should eq("[[0,0,2][1,1,4][2,2,6]]")
    end
    
    it "Resta de matrices dispersas" do
       (@matrizdis1-@matrizdis2).to_s().should eq("[[0,0,0][1,1,0][2,2,0]]")
    end
end
########################################################
#####OPERACIONES ENTRE MATRICES DISPERSAS Y DENSAS######
########################################################
describe "#Operaciones de matrices dispersas y densas" do
    it "Suma de Matrices Dispersas y Densas" do
	(@matrizdis1+@matrizden1).to_s().should eq("[[2, 2, 3], [4, 7, 6], [7, 8, 12]]")
    end
    
    it "Suma de Matrices Densas y Dispersas" do
        (@matrizden1+@matrizdis1).to_s().should eq("[[2, 2, 3], [4, 7, 6], [7, 8, 12]]") 
    end
    
##################################################################
#########MÁXIMO Y MÍNIMO DE MATRICES DENSAS#######################
##################################################################
describe "Maximo y minimo de matrices densas" do

    it"El maximo de una matriz densa se realiza correctamente" do
        @matrizden1.maximo.should eq (9)
      end
      it"El minimo de una matriz densa se realiza correctamente" do
        @matrizden2.minimo.should eq (1)
      end
  end
end
end
