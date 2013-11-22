###############################################
####Pruebas Unitarias Matriz Dispersa##########
###############################################

require "test/unit"
require "../lib/matriz.rb"

class TestMatrizDensa < Test::Unit::TestCase

   def testmatriz1

    @matrizden1 = Densa.new(3,3,[1,2,3,4,5,6,7,8,9])
    @matrizden2 = Densa.new(3,3,[1,2,3,4,5,6,7,8,9])
    @matrizden3 = Densa.new(3,3,[2,4,6,8,10,12,14,16,18])
    @matrizden4 = Densa.new(3,3,[0,0,0,0,0,0,0,0,0])

    @matrizdis1 = Dispersa.new(3,3,[0,1,2],[0,1,2],[1,2,3])
    @matrizdis2 = Dispersa.new(3,3,[0,1,2],[0,1,2],[1,2,3])
    @matrizdis3 = Dispersa.new(3,3,[0,0,2,1,1,4,2,2,6])

    @matrizfrac1 = Densa.new(3,3,[Racional.new(1,2),Racional.new(1,3),Racional.new(1,4),Racional.new(1,5),Racional.new(1,6),Racional.new(1,7),Racional.new(1,8),Racional.new(1,9),Racional.new(1,10)])
    @matrizfrac2 = Densa.new(3,3,[Racional.new(1,2),Racional.new(1,3),Racional.new(1,4),Racional.new(1,5),Racional.new(1,6),Racional.new(1,7),Racional.new(1,8),Racional.new(1,9),Racional.new(1,10)])
    @matrizfrac3 = Densa.new(3,3,[Racional.new(2,2),Racional.new(2,3),Racional.new(2,4),Racional.new(2,5),Racional.new(2,6),Racional.new(2,7),Racional.new(2,8),Racional.new(2,9),Racional.new(2,10)])
end  
   def testdensa
   
   assert_equal(@matrizden3,@matrizden1 + @matrizden2)
   
   assert_equal(@matrizden4,@matrizden1 - @matriz2)
  
   end

   def fraccionales

  assert_equal(@matrizfrac3,@matrizfrac1 + @matrizfrac2)
  assert_equal(@matrizfrac1,@matrizfrac3 - @matrizfrac2)

end
   def testdispersa

    assert_equal(@matrizdis3,@matrizdis1 + @matrizdis2)
 
   end

   def maxmin
  
    assert_equal(@matrizden1.maximo,9)
    
    assert_equal(@matrizden2.minimo,1)

   end

   def test_failure

     assert_not_equal(@matrizdis3,@matrizdis2*@matrizdis1)

   end

end
