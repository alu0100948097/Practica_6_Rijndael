class Multiplicacion
	
    attr_reader :primer, :segundo, :algoritmo
	
    def initialize
		@primer=""
        @segundo=""
        @algoritmo=""
	end
    
    def primer=(p)
		@primer=p.hex.to_s(2).rjust(8,'0')
	end
    
    def segundo=(s)
		@segundo=s.hex.to_s(2).rjust(8,'0')
	end
    
    def algoritmo=(a)
        @algoritmo=a.hex.to_s(2).rjust(8,'0')
    end
    
    def izq(b)
        temp=b.split("")
        for i in (0..temp.length-2)
            temp[i]=temp[i+1]
        end
        temp[temp.length-1]="0"
        return temp.join
    end
    
    def XOR(a,b)
        temp=a.unpack('C*').zip(b.unpack('C*'))
        temp=temp.map {|x,y| x^y}.join
        return temp
    end
    
    def operacion(n)
        temp=""
        for i in (0..n)
            if (i==0)
                temp=@primer
            elsif (temp[0]=="1")
                temp=XOR(izq(temp),algoritmo)
            else
                temp=izq(temp)
            end
        end
        return temp
    end
    
    def multiplicar
        temp=[]
        suma=[]
        
        for i in (0..@segundo.length-1)
            if (@segundo[i]=="1")
                temp.push(7-i)
            end
        end
        
        if temp.empty?
            return @segundo
        end
        
        temp.reverse!
        
        for i in (0..temp.length-1)
            suma.push(operacion(temp[i]))
        end
        
        t=suma[0]
        
        for i in (1..suma.length-1)
            t=XOR(t,suma[i])
        end
        
        return t
    end
    
end
