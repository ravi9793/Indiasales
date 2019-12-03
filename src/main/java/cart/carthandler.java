package cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import config.Configuration;

import product.Producthandler;

interface CartStandard{
String insert(Cart c);
List<Cart> fetchAllCarts();

List<Cart> fetchAllCartItemsForUser( int userId );

boolean checkCartIn( int userId,int productId);

boolean deleteById(int id);

boolean deleteOrder(int userId);

Cart fetchProduct(int id);
}




public class carthandler implements CartStandard{

public List<Cart> fetchAllCartItemsForUser(int userId) {
List<Cart> list = new ArrayList<Cart>();
try {
String query = "select * from cart where userId = ?";

Connection conn = Configuration.conn;
PreparedStatement p = conn.prepareStatement(query);

p.setInt(1, userId);

ResultSet rs = p.executeQuery();

Producthandler ph = new Producthandler();

while (rs.next()) {

Cart c = new Cart();
c.setId(rs.getInt("id"));
c.setUserId(rs.getInt("userId"));
c.setQty(rs.getInt("qty"));
c.setProductId(rs.getInt("productId"));

c.setProduct(ph.fetchProduct(c.getProductId()));

list.add(c);

}

} catch (Exception e) {
e.printStackTrace();
}
return list;
}

public String insert(Cart c) {
try {
String query="insert into cart(productId,userId,qty) values(?,?,?)";
Connection conn=Configuration.conn;
PreparedStatement ps=conn.prepareStatement(query);

ps.setInt(1, c.getProductId());
ps.setInt(2, c.getUserId());
ps.setInt(3, c.getQty());

ps.executeUpdate();
}catch(Exception e) {
e.printStackTrace();
return e.getMessage();
}
return "successfully inserted";
}

public List<Cart> fetchAllCarts() {
List<Cart> list = new ArrayList<Cart>();
try {
String query = "select * from cart";

Connection conn = Configuration.conn;
PreparedStatement p = conn.prepareStatement(query);

ResultSet rs = p.executeQuery();

while (rs.next()) {

list.add(new Cart(rs.getInt("id"),
rs.getInt("userId"),
rs.getInt("productId"),rs.getInt("qty")

));

}

} catch (Exception e) {
e.printStackTrace();
}
return list;
}

public boolean checkCartIn(int userId, int productId) {
try {
String query = "select * from cart where userId=? and productId=?";

Connection conn = Configuration.conn;
PreparedStatement p = conn.prepareStatement(query);

p.setInt(2, productId);
p.setInt(1, userId);

ResultSet rs = p.executeQuery();
return rs.next();

} catch (Exception e) {
e.printStackTrace();
}


return false;
}

public boolean deleteById(int id) {

try {

String query = "delete from cart where id=?";
Connection conn = Configuration.conn;
PreparedStatement p = conn.prepareStatement(query);

p.setInt(1, id);
p.executeUpdate();

return true;

} catch (Exception e) {
e.printStackTrace();

}


return false;

}

public Cart fetchProduct(int id) {
try {

String query = "select * from cart where id= ?";
Connection conn = Configuration.conn;
PreparedStatement p = conn.prepareStatement(query);

p.setInt(1, id);

ResultSet rs = p.executeQuery();

while (rs.next()) {
return new Cart(
rs.getInt("id"),
rs.getInt("productId"),
rs.getInt("userId"),
rs.getInt("qty"));

}

}
catch (Exception e)
{
e.printStackTrace();
}
return new Cart();

}

public boolean deleteOrder(int userId) {
try {

String query = "delete from cart where userId=?";
Connection conn = Configuration.conn;
PreparedStatement p = conn.prepareStatement(query);

p.setInt(1, userId);
p.executeUpdate();

return true;

} catch (Exception e) {
e.printStackTrace();

}


return false;
}

}

