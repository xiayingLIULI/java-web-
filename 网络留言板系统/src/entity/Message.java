/*
 * 
 * 留言类
 */
package entity;

public class Message {
    private int id;         // 留言id
    private String message;  // 留言内容
    private String author;   // 作者
    private String postTime; // 发布时间
    
    /**
     * @return id
     */
    public int getId() {
        return id;
    }
    
    /**
     * @param id 要设置的 id
     */
    public void setId(int id) {
        this.id = id;
    }
    
    /**
     * @return message
     */
    public String getMessage() {
        return message;
    }
    
    /**
     * @param message 要设置的 message
     */
    public void setMessage(String message) {
        this.message = message;
    }
    
    /**
     * @return author
     */
    public String getAuthor() {
        return author;
    }
    
    /**
     * @param author 要设置的 author
     */
    public void setAuthor(String author) {
        this.author = author;
    }
    
    /**
     * @return postTime
     */
    public String getPostTime() {
        return postTime;
    }
    
    /**
     * @param postTime 要设置的 postTime
     */
    public void setPostTime(String postTime) {
        this.postTime = postTime;
    }
}
