import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;


public class Laberinto {

	private char[][] arreglo;
	private BufferedReader bufferedReader;
	private int[] filcol;
	
	public char[][] getArreglo(){
		return arreglo;
	}
	
	public int[] getFilCol(){
		return filcol;
	}
	
	public void leerText(String texto)
	{
		 // Leer una linea a la vez 
        String line = null;
        int largo = 0;
        int cont=0;
        try 
        {
            // FileReader lee el texto 
            FileReader fileReader = new FileReader(texto);
            bufferedReader = new BufferedReader(fileReader);

            //Ciclo para llenar la matriz leyendo linea por linea
            while((line = bufferedReader.readLine()) != null) 
            {
            	System.out.println(line);
            	for (int i=0;i<line.length();i++){
            		arreglo[cont][i]=line.charAt(i);
            	}
            	cont++;
            }   
            
            // Cerrar el archivo
            bufferedReader.close(); 
        }
        //Si no logra abrir el archivo mandar un mensaje 
        catch(IOException ex) 
        {
            System.out.println(
                "No se pudo leer el archivo '" 
                + texto + "'");   
        }
	}
	
	public void busca(int x, int y){
		boolean band = false; 
		
		if (arreglo[y][x]=='*'){
			band=true;
			System.out.println("Ha encontrado la salida!");
		}
		else 
		{
			if (Character.isWhitespace(arreglo[y][x])){
				arreglo[y][x]='.';
				if (band==false) busca(x,y+1);
				if (band==false) busca(x-1,y);
				if (band==false) busca(x+1,y);
				if (band==false) busca(x,y-1);
			}
		}
	}

	
}
