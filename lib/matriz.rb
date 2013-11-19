require 'rubygems'
require 'bundler/setup'
require 'nokogiri'

class Matrices
        include Comparable
        include Enumerable

        def initialize(m)
                
        end
        
        attr_reader :filas, :columnas, :matriz



        def mostrar

        end

        def + (other)
                raise "you must define method +"
        end

        def - (other)
                raise "you must define method -"
        end

        def * (other)
                raise "you must define method *"
        end

        def traspuesta
                raise "you must define method traspuesta"
        end

        def opuesta
                raise "you must define method opuesta"
        end
end


class Dispersa < Matrices
  def initialize
    puts 'dispersa initializer'
    super
  end
end


class Densa < Matrices

        def initialize(m)
                @filas = m.size
                @columnas = m[1].size
                @matriz = m
        end
        
        attr_reader :filas, :columnas, :matriz

#####Mostrar matriz

        def mostrar
                i=0
                 while i < @matriz.length
                 #print "Posicion #{i}---> "
                 print @matriz[i]
                 print "\n"
                 i += 1
                 end #Fin del bucle
        end



#####Cálculo de Suma de Matrices Enteras
        def +(other)
              i=0
                 matriz_cp = @matriz
                while i < @filas
                        j=0
                        while j < @columnas
                           matriz_cp[i][j] = matriz_cp[i][j] + other.matriz[i][j]
                                j += 1
                        end
                        i += 1
                end
                Matrices.new(matriz_cp)
        end

####Cálculo Resta de Matrices Enteras
        def -(other)
                i=0
                 matriz_cp = @matriz
                while i < @filas
                        j=0
                        while j < @columnas
                           matriz_cp[i][j] = matriz_cp[i][j] - other.matriz[i][j]
                                j += 1
                        end
                        i += 1
                end
                Matrices.new(matriz_cp)
        end


#####Calculo de Multiplicacion Mátrices enteras
        def * (other)
                i=0
                 matriz_cp = Array.new(@filas) {Array.new(other.columnas)}
                while i < @filas
                        j=0
                        while j < other.columnas
                                matriz_cp[i][j] = 0
                                k=0
                                while k < @columnas
                                   matriz_cp[i][j] = matriz_cp[i][j] + (matriz[i][k] * other.matriz[k][j])
                                        k+=1
                                end
                                j += 1
                        end
                        i += 1
                end
                Matrices.new(matriz_cp)
        end




####Traspuesta de una matriz
        def traspuesta
                i=0
                mtrasp = Array.new(@filas) {Array.new(self.columnas)}
                while i < @filas
                        j=0
                        while j < @columnas
                                mtrasp[i][j] = self.matriz[j][i]
                                j+=1
                        end
                        i+=1
                end
                Matrices.new(mtrasp)
        end


####Opuesta de una matriz
        def opuesta

                i=0
                mop = Array.new(@filas) {Array.new(self.columnas)}
                while i < @filas
                        j=0
                        while j < @columnas
                                mop[i][j] = (self.matriz[i][j]) * (- 1)
                                j+=1
                        end
                        i+=1
                end
                Matrices.new(mop)

        end

############Método Mínimo######################################
      def minimo
                
          min = self.matriz[0][0]                
                i=0                                                                
                while i < @filas                                                 
                       j=0
                       while j < @columnas                                        
                              if(self.matriz[i][j] < min)                                        
                                        min = self.matriz[i][j]                                        
			      end
                              j+= 1                                
                        end
                        i+= 1                        
                end                                
                return min                
        end        

##############Método Máximo######################################
       def maximo
                
           max = self.matriz[0][0]                
                i = 0                                                                                
                while i < @filas                                                                       
                        j = 0                        
                        while j < @columnas                                                                        
                                if(self.matriz[i][j] > max)                                        
                                        max = self.matriz[i][j]                                        
                                end                                
                                j+= 1                                
                        end                        
                        i+= 1                        
                end                                
          return max                
        end        
end



class SparseVector
	attr_reader :vector

	def initialize(h = {})
		@vector = Hash.new(0)
		@vector = @vector.merge!(h)
	end

	def [](i)
		@vector[i] 
	end

	def to_s
		@vector.to_s
	end
end

class MatrizDispersa < Matrices

	attr_reader :matrix

	def initialize(h = {})
		@matrix = Hash.new({})
		for k in h.keys do 
			@matrix[k] = if h[k].is_a? SparseVector
			h[k]
		else 
			@matrix[k] = SparseVector.new(h[k])
		end
	end
end

	def [](i)
		@matrix[i]
	end

	def col(j)
		c = {}
		for r in @matrix.keys do
			c[r] = @matrix[r].vector[j] if @matrix[r].vector.keys.include? j
		end
		SparseVector.new c
	end

	def prb
		
		for i in 1..3
			for j in 1..3
				if self[i][j] == nil || self[i][j]==0
					puts "0 o Nil"			
				else
					puts self[i][j]
					puts i,j
				end
			end
		end
	end

	def + (other)
		 
		i=1
                matriz_cp = @matrix
                while i < 3
                        j=1
                        while j < 3
                           matriz_cp[i][j] = matriz_cp[i][j] + other[i][j]
                                j += 1
                        end
                        i += 1
                end
                #puts MatrizDispersa.new(matriz_cp)		
	end


end
