class Rijndael
    
    def initialize
		@S=[['63','7c','77','7b','f2','6b','6f','c5','30','01','67','2b','fe','d7','ab','76'],
        ['ca','82','c9','7d','fa','59','47','f0','ad','d4','a2','af','9c','a4','72','c0'],
        ['b7','fd','93','26','36','3f','f7','cc','34','a5','e5','f1','71','d8','31','15'],
        ['04','c7','23','c3','18','96','05','9a','07','12','80','e2','eb','27','b2','75'],
        ['09','83','2c','1a','1b','6e','5a','a0','52','3b','d6','b3','29','e3','2f','84'],
        ['53','d1','00','ed','20','fc','b1','5b','6a','cb','be','39','4a','4c','58','cf'],
        ['d0','ef','aa','fb','43','4d','33','85','45','f9','02','7f','50','3c','9f','a8'],
        ['51','a3','40','8f','92','9d','38','f5','bc','b6','da','21','10','ff','f3','d2'],
        ['cd','0c','13','ec','5f','97','44','17','c4','a7','7e','3d','64','5d','19','73'],
        ['60','81','4f','dc','22','2a','90','88','46','ee','b8','14','de','5e','0b','db'],
        ['e0','32','3a','0a','49','06','24','5c','c2','d3','ac','62','91','95','e4','79'],
        ['e7','c8','37','6d','8d','d5','4e','a9','6c','56','f4','ea','65','7a','ae','08'],
        ['ba','78','25','2e','1c','a6','b4','6c','e8','dd','74','1f','4b','bd','8b','8a'],
        ['70','3e','b5','66','48','03','f6','0e','61','35','57','b9','86','c1','1d','9e'],
        ['e1','f8','98','11','69','d9','8e','94','9b','1e','87','e9','ce','55','28','df'],
        ['8c','a1','89','0d','bf','e6','42','68','41','99','2d','0f','b0','54','bb','16']]
        @texto=matriz(4,4)
        @clave=matriz(4,4)
        @matriz_mix=[[2,3,1,1], [1,2,3,1], [1,1,2,3], [3,1,1,2]]
	end
    
    def rellenar_matriz(t)
        temp=matriz(4,4)
        k=0
        t=t.scan(/.{2}/)
        for i in 0..3
            for j in 0..3
                temp[j][i]=t[k]
                k=k+1
            end
        end
        return temp
    end
    
    def texto=(t)
        @texto=rellenar_matriz(t)
    end
    
    def clave=(c)
        @clave=rellenar_matriz(c)
    end
    
    def matriz(x,y)
        return Array.new(x){Array.new(y,0)}
    end
    
    def subBytes
        for i in 0..3
            for j in 0..3
                @texto[j][i]=@S[@texto[j][i][0].hex][@texto[j][i][1].hex]
            end
        end
    end
    
    def shiftRow
        t=[]
        t.push(@texto[1][0])
        for i in 0..2
            @texto[1][i]=@texto[1][i+1]
        end
        @texto[1][3]=t[0]
        t.clear
        t.push(@texto[2][0])
        t.push(@texto[2][1])
        for i in 0..1
            @texto[2][i]=@texto[2][i+2]
        end
        @texto[2][2]=t[0]
        @texto[2][3]=t[1]
        t.clear
        t.push(@texto[3][0])
        t.push(@texto[3][1])
        t.push(@texto[3][2])
        @texto[3][0]=@texto[3][3]
        @texto[3][1]=t[0]
        @texto[3][2]=t[1]
        @texto[3][3]=t[2]
        t.clear
    end
end
