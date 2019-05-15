package Bean;

public class AutoreBean implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7448906190432738797L;
	
	private String BioAut; 
	private int CodAut; 
	private String LinAut; 
	private String NomAut;
	
	public String getBioAut() {
		return BioAut;
	}
	public void setBioAut(String bioAut) {
		BioAut = bioAut;
	}
	public int getCodAut() {
		return CodAut;
	}
	public void setCodAut(int codAut) {
		CodAut = codAut;
	}
	public String getLinAut() {
		return LinAut;
	}
	public void setLinAut(String linAut) {
		LinAut = linAut;
	}
	public String getNomAut() {
		return NomAut;
	}
	public void setNomAut(String nomAut) {
		NomAut = nomAut;
	} 
}