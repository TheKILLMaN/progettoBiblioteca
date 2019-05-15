package Bean;

public class CategoriaBean implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -446903480496388063L;
	
	private int CodCat; 
	private String NomeCat;
	
	public int getCodCat() {
		return CodCat;
	}
	public void setCodCat(int i) {
		CodCat = i;
	}
	public String getNomeCat() {
		return NomeCat;
	}
	public void setNomeCat(String nomeCat) {
		NomeCat = nomeCat;
	}	
}
