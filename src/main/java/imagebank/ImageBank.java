package imagebank;

public class ImageBank {
	
	int id;
	String url;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "ImageBank [id=" + id + ", url=" + url + "]";
	}
	public ImageBank(int id, String url) {
		super();
		this.id = id;
		this.url = url;
	}
	public ImageBank(String url) {
		super();
		this.url = url;
	}
	public ImageBank() {
		super();
	}

	
	
}
