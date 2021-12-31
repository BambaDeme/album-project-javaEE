package beans;



public class Images {
	private int id, id_album;
	private String titre, description, fichier;
	private double hauteur, largeur;
	private String dateXreation, dateMiseAjour;
	
	public Images() {
		
	}
	public Images(int id, int id_album, String titre, String description, String fichier, double hauteur,
			double largeur, String dateXreation, String dateMiseAjour) {
		super();
		this.id = id;
		this.id_album = id_album;
		this.titre = titre;
		this.description = description;
		this.fichier = fichier;
		this.hauteur = hauteur;
		this.largeur = largeur;
		this.dateXreation = dateXreation;
		this.dateMiseAjour = dateMiseAjour;
	}
	public Images(int id_album, String titre, String description, String fichier, double hauteur, double largeur,
			String dateXreation, String dateMiseAjour) {
		super();
		this.id_album = id_album;
		this.titre = titre;
		this.description = description;
		this.fichier = fichier;
		this.hauteur = hauteur;
		this.largeur = largeur;
		this.dateXreation = dateXreation;
		this.dateMiseAjour = dateMiseAjour;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_album() {
		return id_album;
	}
	public void setId_album(int id_album) {
		this.id_album = id_album;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getFichier() {
		return fichier;
	}
	public void setFichier(String fichier) {
		this.fichier = fichier;
	}
	public double getHauteur() {
		return hauteur;
	}
	public void setHauteur(double hauteur) {
		this.hauteur = hauteur;
	}
	public double getLargeur() {
		return largeur;
	}
	public void setLargeur(double largeur) {
		this.largeur = largeur;
	}
	public String getDateXreation() {
		return dateXreation;
	}
	public void setDateXreation(String dateXreation) {
		this.dateXreation = dateXreation;
	}
	public String getDateMiseAjour() {
		return dateMiseAjour;
	}
	public void setDateMiseAjour(String dateMiseAjour) {
		this.dateMiseAjour = dateMiseAjour;
	}
	
	
	
}
