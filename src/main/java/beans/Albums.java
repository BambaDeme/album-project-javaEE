package beans;

public class Albums {
	private int id,id_proprietaire;
	private String theme, visibility,cover;
	
	public Albums(){
		
	}
	
	public Albums(int id, int proprietaire, String theme, String visibility,String cover){
		this.id = id;
		this.id_proprietaire = proprietaire;
		this.theme = theme;
		this.visibility = visibility;
		this.cover = cover;
	}
	
	public Albums(int proprietaire, String theme, String visibility,String cover){
		this.id_proprietaire = proprietaire;
		this.theme = theme;
		this.visibility = visibility;
		this.cover = cover;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId_proprietaire() {
		return id_proprietaire;
	}

	public void setId_proprietaire(int id_proprietaire) {
		this.id_proprietaire = id_proprietaire;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public String getVisibility() {
		return visibility;
	}

	public void setVisibility(String visibility) {
		this.visibility = visibility;
	}
	
	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}
	
	
}
