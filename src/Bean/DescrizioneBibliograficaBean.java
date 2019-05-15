package Bean;

public class DescrizioneBibliograficaBean implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 149640683393571028L;
	
	private int CodDesBib; 
	private int CodAut; 
	private String TitLib; 
	private int CodCat;
	private String DesLib; 
	private String LinLib;
	private String NomAut;
	private String NomeCat;
	
	public int getCodDesBib() {
		return CodDesBib;
	}
	public void setCodDesBib(int i) {
		CodDesBib = i;
	}
	public int getCodAut() {
		return CodAut;
	}
	public void setCodAut(int i) {
		CodAut = i;
	}
	public String getTitLib() {
		return TitLib;
	}
	public void setTitLib(String titLib) {
		TitLib = titLib;
	}
	public int getCodCat() {
		return CodCat;
	}
	public void setCodCat(int codCat) {
		CodCat = codCat;
	}
	public String getDesLib() {
		return DesLib;
	}
	public void setDesLib(String string) {
		DesLib = string;
	}
	public String getLinLib() {
		return LinLib;
	}
	public void setLinLib(String linLib) {
		LinLib = linLib;
	}
	public String getNomAut() {
		return NomAut;
	}
	public void setNomAut(String nomAut) {
		NomAut = nomAut;
	}
	public String getNomeCat() {
		return NomeCat;
	}
	public void setNomeCat(String nomeCat) {
		NomeCat = nomeCat;
	} 
	
	
}
