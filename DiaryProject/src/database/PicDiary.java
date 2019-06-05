package database;

public class PicDiary {

	private int id;
	private String content;
	private String image;
	private String date;
	
	public PicDiary(int id, String content, String image, String date) {
		super();
		this.id = id;
		this.content = content;
		this.image = image;
		this.date = date;
	}

	public PicDiary() {
		super();
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
}
