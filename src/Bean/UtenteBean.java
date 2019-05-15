package Bean;

public class UtenteBean implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4237967081724932864L;
	
	private String Admin; 
	private int CelUte; 
	private int CodUte; 
	private String CogUte; 
	private String MaiUte;
	private String NewSle;
	private String NomUte; 
	private String PswUte;
	private String Stu;
	
	public String getAdmin() {
		return Admin;
	}
	public void setAdmin(String admin) {
		Admin = admin;
	}
	public int getCelUte() {
		return CelUte;
	}
	public void setCelUte(int celUte) {
		CelUte = celUte;
	}
	public int getCodUte() {
		return CodUte;
	}
	public void setCodUte(int codUte) {
		CodUte = codUte;
	}
	public String getCogUte() {
		return CogUte;
	}
	public void setCogUte(String cogUte) {
		CogUte = cogUte;
	}
	public String getMaiUte() {
		return MaiUte;
	}
	public void setMaiUte(String maiUte) {
		MaiUte = maiUte;
	}
	public String getNewSle() {
		return NewSle;
	}
	public void setNewSle(String newSle) {
		NewSle = newSle;
	}
	public String ùgetNomUte() {
		return NomUte;
	}
	public void setNomUte(String nomUte) {
		NomUte = nomUte;
	}
	public String getPswUte() {
		return PswUte;
	}
	public void setPswUte(String pswUte) {
		PswUte = pswUte;
	}
	public String getStu() {
		return Stu;
	}
	public void setStu(String stu) {
		Stu = stu;
	} 
}
