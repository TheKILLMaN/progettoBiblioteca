package progetto_Biblioteca.bean;

//import java.util.ArrayList;


public class TblAutore implements java.io.Serializable{
	
	

	/**
	 * 
	 */
	private static final long serialVersionUID = -5382718847894133754L;

	//private int CodAut;
	private String NomAut;
	private String BioAut;
	private String LinAut;
	
	/*
	public int getCodAut() {
		return CodAut;
	}
	
	public void setCodAut(int codAut) {
		CodAut = codAut;
	}
	*/
	
	
	public String getNomAut() {
		return NomAut;
	}
	
	public void setNomAut(String nomAut) {
		NomAut = nomAut;
	}
	
	
	
	public String getBioAut() {
		return BioAut;
	}
	
	public void setBioAut(String bioAut) {
		BioAut = bioAut;
	}
	
	
	
	public String getLinAut() {
		return LinAut;
	}
	
	public void setLinAut(String linAut) {
		LinAut = linAut;
	}
	

}
