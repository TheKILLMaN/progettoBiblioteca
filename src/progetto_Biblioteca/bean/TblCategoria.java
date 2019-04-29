package progetto_Biblioteca.bean;



public class TblCategoria implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4928572537378488538L;
	
	
	//private int CodCat;
		private String NomeCat;

	public TblCategoria() {
		// TODO Auto-generated constructor stub
	}

	public String getNomeCat() {
		return NomeCat;
	}

	public void setNomeCat(String nomeCat) {
		NomeCat = nomeCat;
	}

}
