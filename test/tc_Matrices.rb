###############################################
####Pruebas Unitarias Matriz Dispersa##########
###############################################

require "test/unit"
require "../lib/matriz.rb"
require "../lib/racional.rb"

class TestMatrizDensa < Test::Unit::TestCase

    
   def testdensa
   
    assert_equal "[[2, 4, 6], [8, 10, 12], [14, 16, 18]]", (Densa.new(3,3,[1,2,3,4,5,6,7,8,9]) + Densa.new(3,3,[1,2,3,4,5,6,7,8,9])).to_s 
    assert_equal "[[0, 0, 0], [0, 0, 0], [0, 0, 0]]", (Densa.new(3,3,[1,2,3,4,5,6,7,8,9]) - Densa.new(3,3,[1,2,3,4,5,6,7,8,9])).to_s 
  
   end

   def fracciones

    assert_equal "[[1/1, 1/1], [1/1, 1/1]]", (MatrizDensa.new(2,2,[Fraccion.new(1,2),Fraccion.new(1,3),Fraccion.new(1,4),Fraccion.new(1,5)]) + MatrizDensa.new(2,2,[Fraccion.new(1,2),Fraccion.new(2,3),Fraccion.new(3,4),Fraccion.new(4,5)])).to_s

    assert_not_equal "[[3/6, 1/1], [1/1, 1/1]]", (MatrizDensa.new(2,2,[Fraccion.new(1,2),Fraccion.new(1,3),Fraccion.new(1,4),Fraccion.new(1,5)]) + MatrizDensa.new(2,2,[Fraccion.new(1,2),Fraccion.new(2,3),Fraccion.new(3,4),Fraccion.new(4,5)])).to_s    

end
   def testdispersa

    assert_equal "[[0,0,2][1,1,4][2,2,6]]", (Dispersa.new(3,3,[0,1,2],[0,1,2],[1,2,3]) + Dispersa.new(3,3,[0,1,2],[0,1,2],[1,2,3])).to_s


   end

   def maxmin
  
    assert_equal(@matrizden1.maximo,9)
    
    assert_equal(@matrizden2.minimo,1)

   end
 
end

