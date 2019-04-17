package progetto_Biblioteca.bean;

import java.util.ArrayList;



public class TblBiblio implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2268567522696016195L;

	private int CodDesBib;
	private int CodAut;
	private String TitLib;
	private int CodCat;
	private String DesLib;
	private String LinLib;
	
	
	private ArrayList<TblBiblio> BiblioDes;
	
	
	
	public int getCodDesBib() {
		return CodDesBib;
	}
	public void setCodDesBib(int codDesBib) {
		CodDesBib = codDesBib;
	}
	public int getCodAut() {
		return CodAut;
	}
	public void setCodAut(int codAut) {
		CodAut = codAut;
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
	public void setDesLib(String desLib) {
		DesLib = desLib;
	}
	public String getLinLib() {
		return LinLib;
	}
	public void setLinLib(String linLib) {
		LinLib = linLib;
	}
		
	
	public ArrayList<TblBiblio> getBiblioDes() {
		return BiblioDes;
	}
	public void setBiblioDes(ArrayList<TblBiblio> biblioDes) {
		BiblioDes = biblioDes;
	}

}
