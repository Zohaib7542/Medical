package org.example;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class Ambulance{
    private Connection conn;
    Scanner sc = new Scanner(System.in);

    public Ambulance(Connection conn) {
        this.conn = conn;
    }

    public void bookAmbulance() throws SQLException {
        String query = "select * from ambulance";

        try (PreparedStatement ps = conn.prepareStatement(query)) {
            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    int id = rs.getInt("id");

                    System.out.println("Ambulance number:" + id);


                }
                System.out.println("Ambulance is on the way to your address in 5 minutes.");
            }
        }
    }
    public boolean getAmbulanceById(int id) throws SQLException {
        String query = "select count(1) from ambulance where id = ?";

        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }
}
