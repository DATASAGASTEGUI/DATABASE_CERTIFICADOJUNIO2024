package ejemplo9;

import java.awt.*;
import javax.swing.*;
import java.sql.*;

public class MenuCRUDMySQL_window extends javax.swing.JFrame {

    Connection connection = Methods.obtainConnection();
    DefaultListModel dlm = new DefaultListModel();
    DefaultListModel dlmU = new DefaultListModel();
    DefaultListModel dlmP = new DefaultListModel();
    DefaultListModel dlmUP = new DefaultListModel();
    DefaultListModel dlmTP = new DefaultListModel();

    public MenuCRUDMySQL_window() {
        initComponents();
        personalizarVentana();
        lstDisplay.setModel(dlm);
        lstDisplayUsers.setModel(dlmU);
        lstDisplayPrivileges.setModel(dlmP);
        lstDisplayUsersPrivileges.setModel(dlmUP);
        lstDisplayThePrivileges.setModel(dlmTP);
        loadLists();
    }

    public void loadLists() {
        Methods.showUsers(connection, dlm);
        Methods.showUsers(connection, dlmU);
        Methods.showUsers(connection, dlmUP);
        Methods.showPrivileges(connection, dlmP);
    }
    
    //Personalizar las caracteristicas de la ventana inicio

    public void personalizarVentana() {
        ImageIcon icono = new ImageIcon("image/icono.icns");
        Image image = icono.getImage();
        this.setIconImage(image);//Cambiar el icono de la ventana

        this.setTitle("Convert");
        this.setResizable(false); //No se redimensione
        this.setLocationRelativeTo(null);//Colocar la ventana en el centro de la pantalla

    }
    //Personalizar las caracteristicas de la ventana fin   

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jTabbedPane5 = new javax.swing.JTabbedPane();
        jPanel3 = new javax.swing.JPanel();
        lblTitleCreate = new javax.swing.JLabel();
        lbluser = new javax.swing.JLabel();
        txtName = new javax.swing.JTextField();
        btnCreate = new javax.swing.JButton();
        txtPass = new javax.swing.JTextField();
        lblPass = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        lstDisplay = new javax.swing.JList<>();
        btnDelete = new javax.swing.JButton();
        btnRefreshCD = new javax.swing.JButton();
        jSeparator5 = new javax.swing.JSeparator();
        jSeparator6 = new javax.swing.JSeparator();
        jPanel2 = new javax.swing.JPanel();
        lblTitleShow = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        lstDisplayPrivileges = new javax.swing.JList<>();
        btnRevoke = new javax.swing.JButton();
        btnGrant = new javax.swing.JButton();
        jScrollPane3 = new javax.swing.JScrollPane();
        lstDisplayUsers = new javax.swing.JList<>();
        jSeparator1 = new javax.swing.JSeparator();
        jSeparator2 = new javax.swing.JSeparator();
        btnRefresh = new javax.swing.JButton();
        lblResultR = new javax.swing.JLabel();
        lblResultG = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jPanel4 = new javax.swing.JPanel();
        jScrollPane4 = new javax.swing.JScrollPane();
        lstDisplayThePrivileges = new javax.swing.JList<>();
        jScrollPane5 = new javax.swing.JScrollPane();
        lstDisplayUsersPrivileges = new javax.swing.JList<>();
        btnDisplayPrivileges = new javax.swing.JButton();
        jSeparator3 = new javax.swing.JSeparator();
        jSeparator4 = new javax.swing.JSeparator();
        lblTitleShow1 = new javax.swing.JLabel();
        btnRefreshP = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        lblTitleCreate.setFont(new java.awt.Font("Helvetica Neue", 1, 18)); // NOI18N
        lblTitleCreate.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        lblTitleCreate.setText("Create or Delete User");

        lbluser.setFont(new java.awt.Font("Helvetica Neue", 1, 14)); // NOI18N
        lbluser.setText("Insert User:");

        txtName.setFont(new java.awt.Font("Helvetica Neue", 1, 14)); // NOI18N

        btnCreate.setFont(new java.awt.Font("Helvetica Neue", 1, 14)); // NOI18N
        btnCreate.setText("Create");
        btnCreate.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCreateActionPerformed(evt);
            }
        });

        txtPass.setFont(new java.awt.Font("Helvetica Neue", 1, 14)); // NOI18N

        lblPass.setFont(new java.awt.Font("Helvetica Neue", 1, 14)); // NOI18N
        lblPass.setText("Insert password:");

        lstDisplay.setFont(new java.awt.Font("Helvetica Neue", 1, 14)); // NOI18N
        jScrollPane1.setViewportView(lstDisplay);

        btnDelete.setFont(new java.awt.Font("Helvetica Neue", 1, 14)); // NOI18N
        btnDelete.setText("Delete");
        btnDelete.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDeleteActionPerformed(evt);
            }
        });

        btnRefreshCD.setFont(new java.awt.Font("Helvetica Neue", 1, 14)); // NOI18N
        btnRefreshCD.setText("Refresh");
        btnRefreshCD.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRefreshCDActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(lblTitleCreate, javax.swing.GroupLayout.DEFAULT_SIZE, 493, Short.MAX_VALUE)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGap(41, 41, 41)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 140, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(lbluser, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(txtName, javax.swing.GroupLayout.PREFERRED_SIZE, 140, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(lblPass, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(txtPass, javax.swing.GroupLayout.PREFERRED_SIZE, 140, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(31, 31, 31)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(btnCreate, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 83, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGap(1, 1, 1)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(btnRefreshCD)
                            .addComponent(btnDelete, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 82, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addComponent(jSeparator5)
            .addComponent(jSeparator6)
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addComponent(lblTitleCreate, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jSeparator5, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(2, 2, 2)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(lbluser, javax.swing.GroupLayout.PREFERRED_SIZE, 39, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(txtName, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(8, 8, 8)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(txtPass, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(lblPass, javax.swing.GroupLayout.PREFERRED_SIZE, 39, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 194, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(btnRefreshCD)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnDelete)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnCreate)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 83, Short.MAX_VALUE)
                .addComponent(jSeparator6, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(24, 24, 24))
        );

        jTabbedPane5.addTab("1. Create/Delete User", jPanel3);

        lblTitleShow.setFont(new java.awt.Font("Helvetica Neue", 1, 18)); // NOI18N
        lblTitleShow.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        lblTitleShow.setText("Show Users and grant or revoke Privileges");

        lstDisplayPrivileges.setFont(new java.awt.Font("Helvetica Neue", 1, 14)); // NOI18N
        lstDisplayPrivileges.setToolTipText("");
        jScrollPane2.setViewportView(lstDisplayPrivileges);

        btnRevoke.setFont(new java.awt.Font("Helvetica Neue", 1, 14)); // NOI18N
        btnRevoke.setText("Revoke");
        btnRevoke.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRevokeActionPerformed(evt);
            }
        });

        btnGrant.setFont(new java.awt.Font("Helvetica Neue", 1, 14)); // NOI18N
        btnGrant.setText("Grant");
        btnGrant.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGrantActionPerformed(evt);
            }
        });

        lstDisplayUsers.setFont(new java.awt.Font("Helvetica Neue", 1, 14)); // NOI18N
        jScrollPane3.setViewportView(lstDisplayUsers);

        btnRefresh.setFont(new java.awt.Font("Helvetica Neue", 1, 14)); // NOI18N
        btnRefresh.setText("Refresh");
        btnRefresh.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRefreshActionPerformed(evt);
            }
        });

        lblResultR.setFont(new java.awt.Font("Helvetica Neue", 1, 14)); // NOI18N
        lblResultR.setForeground(new java.awt.Color(255, 0, 51));
        lblResultR.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);

        lblResultG.setFont(new java.awt.Font("Helvetica Neue", 1, 14)); // NOI18N
        lblResultG.setForeground(new java.awt.Color(51, 153, 0));
        lblResultG.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);

        jLabel1.setFont(new java.awt.Font("Helvetica Neue", 1, 18)); // NOI18N
        jLabel1.setText("Users:");

        jLabel2.setFont(new java.awt.Font("Helvetica Neue", 1, 18)); // NOI18N
        jLabel2.setText("Privileges");

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(lblTitleShow, javax.swing.GroupLayout.DEFAULT_SIZE, 493, Short.MAX_VALUE)
            .addComponent(jSeparator2)
            .addComponent(jSeparator1)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGap(103, 103, 103)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(jScrollPane3, javax.swing.GroupLayout.DEFAULT_SIZE, 140, Short.MAX_VALUE)
                            .addComponent(lblResultR, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 140, Short.MAX_VALUE)
                            .addComponent(lblResultG, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGap(134, 134, 134)
                        .addComponent(btnRefresh)
                        .addGap(68, 68, 68)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(btnRevoke)
                            .addComponent(btnGrant, javax.swing.GroupLayout.PREFERRED_SIZE, 80, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGap(154, 154, 154)
                        .addComponent(jLabel1)
                        .addGap(72, 72, 72)
                        .addComponent(jLabel2)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addComponent(lblTitleShow, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jSeparator2, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(8, 8, 8)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(jLabel2))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jScrollPane2)
                    .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 206, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(btnRefresh)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(btnRevoke)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnGrant)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(lblResultR, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblResultG, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 47, Short.MAX_VALUE)
                .addComponent(jSeparator1, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        jTabbedPane5.addTab("2. Grant/Revoke Users", jPanel2);

        lstDisplayThePrivileges.setFont(new java.awt.Font("Helvetica Neue", 1, 14)); // NOI18N
        jScrollPane4.setViewportView(lstDisplayThePrivileges);

        lstDisplayUsersPrivileges.setFont(new java.awt.Font("Helvetica Neue", 1, 14)); // NOI18N
        jScrollPane5.setViewportView(lstDisplayUsersPrivileges);

        btnDisplayPrivileges.setFont(new java.awt.Font("Helvetica Neue", 1, 14)); // NOI18N
        btnDisplayPrivileges.setText("Display");
        btnDisplayPrivileges.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDisplayPrivilegesActionPerformed(evt);
            }
        });

        lblTitleShow1.setFont(new java.awt.Font("Helvetica Neue", 1, 18)); // NOI18N
        lblTitleShow1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        lblTitleShow1.setText("Show Users Privileges");

        btnRefreshP.setFont(new java.awt.Font("Helvetica Neue", 1, 14)); // NOI18N
        btnRefreshP.setText("Refresh");
        btnRefreshP.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRefreshPActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jSeparator4)
            .addComponent(jSeparator3)
            .addComponent(lblTitleShow1, javax.swing.GroupLayout.DEFAULT_SIZE, 493, Short.MAX_VALUE)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel4Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jScrollPane5, javax.swing.GroupLayout.PREFERRED_SIZE, 140, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(46, 46, 46)
                .addComponent(jScrollPane4, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(51, 51, 51))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel4Layout.createSequentialGroup()
                .addGap(84, 84, 84)
                .addComponent(btnRefreshP)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(btnDisplayPrivileges, javax.swing.GroupLayout.PREFERRED_SIZE, 80, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(114, 114, 114))
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(lblTitleShow1, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(7, 7, 7)
                .addComponent(jSeparator4, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane5, javax.swing.GroupLayout.DEFAULT_SIZE, 297, Short.MAX_VALUE)
                    .addComponent(jScrollPane4))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnDisplayPrivileges)
                    .addComponent(btnRefreshP))
                .addGap(18, 18, 18)
                .addComponent(jSeparator3, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(37, 37, 37))
        );

        jTabbedPane5.addTab("3. Display Privileges", jPanel4);

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jTabbedPane5)
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jTabbedPane5)
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnCreateActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCreateActionPerformed
        String username = txtName.getText();
        String password = txtPass.getText();
        if (username.length() > 0 && password.length() > 0) {
            if (!Methods.userExists(connection, username)) {
                Methods.createUser(connection, username, password);
                dlm.addElement(username);
            } else {
                JOptionPane.showMessageDialog(null, "User exists.", "Information", JOptionPane.INFORMATION_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(null, "Insert a name", "Information", JOptionPane.INFORMATION_MESSAGE);
        }

        txtName.setText("");
        txtPass.setText("");
    }//GEN-LAST:event_btnCreateActionPerformed

    private void btnDeleteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDeleteActionPerformed
        int i = lstDisplay.getSelectedIndex();
        String username = (String) dlm.get(i);
        Methods.deleteUser(connection, username, dlm, lstDisplay);
    }//GEN-LAST:event_btnDeleteActionPerformed

    private void btnRevokeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRevokeActionPerformed
        int i = lstDisplayUsers.getSelectedIndex();
        if (i == -1){
            System.out.println("No user selected");
            return;
        }
        
        String username = (String) dlmU.getElementAt(i);
        System.out.println("User selected " + username);
        
        int[] privileges = lstDisplayPrivileges.getSelectedIndices();
        if(privileges.length == 0){
            System.out.println("No privileges selected ");
            return;
        }
        
        String[] privilegesUser = new String[privileges.length];
        int j = 0;
        
        for(int index: privileges){
            String privilege = (String)dlmP.getElementAt(index);
            privilegesUser[j] = privilege;
            System.out.println("Privileges selected " + privilegesUser[j]);
            j++;
        }
        
            Methods.revokePrivileges(connection, username, privilegesUser);
            lblResultG.setText("");
            lblResultR.setText("Privileges revoked.");
    }//GEN-LAST:event_btnRevokeActionPerformed

    private void btnGrantActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGrantActionPerformed
        int i = lstDisplayUsers.getSelectedIndex();
        if (i == -1){
            System.out.println("No user selected");
            return;
        }
        
        String username = (String) dlmU.getElementAt(i);
        System.out.println("User selected " + username);
        
        int[] privileges = lstDisplayPrivileges.getSelectedIndices();
        if(privileges.length == 0){
            System.out.println("No privileges selected ");
            return;
        }
        
        String[] privilegesUser = new String[privileges.length];
        int j = 0;
        
        for(int index: privileges){
            String privilege = (String)dlmP.getElementAt(index);
            privilegesUser[j] = privilege;
            System.out.println("Privileges selected " + privilegesUser[j]);
            j++;
        }
        
            Methods.grantPrivileges(connection, username, privilegesUser);
            lblResultR.setText("");
            lblResultG.setText("Privileges granted.");
    }//GEN-LAST:event_btnGrantActionPerformed

    private void btnRefreshActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRefreshActionPerformed
        dlmU.clear();
        Methods.showUsers(connection, dlmU);
    }//GEN-LAST:event_btnRefreshActionPerformed

    private void btnRefreshCDActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRefreshCDActionPerformed
        dlm.clear();
        Methods.showUsers(connection, dlm);
    }//GEN-LAST:event_btnRefreshCDActionPerformed

    private void btnDisplayPrivilegesActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDisplayPrivilegesActionPerformed
        int i = lstDisplayUsersPrivileges.getSelectedIndex();
    if (i == -1){
        System.out.println("No user selected");
        return;
    }
    
    String username = (String) dlmUP.getElementAt(i);
    System.out.println("User selected: " + username);
    
    // Clear previous privileges from the display list
    dlmTP.clear();
    
    // Call the method to display the privileges
    Methods.displayPrivileges(connection, username, dlmTP);
    }//GEN-LAST:event_btnDisplayPrivilegesActionPerformed

    private void btnRefreshPActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRefreshPActionPerformed
        dlmTP.clear();
        dlmUP.clear();
        Methods.showUsers(connection, dlmUP);
    }//GEN-LAST:event_btnRefreshPActionPerformed

    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new MenuCRUDMySQL_window().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCreate;
    private javax.swing.JButton btnDelete;
    private javax.swing.JButton btnDisplayPrivileges;
    private javax.swing.JButton btnGrant;
    private javax.swing.JButton btnRefresh;
    private javax.swing.JButton btnRefreshCD;
    private javax.swing.JButton btnRefreshP;
    private javax.swing.JButton btnRevoke;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JScrollPane jScrollPane4;
    private javax.swing.JScrollPane jScrollPane5;
    private javax.swing.JSeparator jSeparator1;
    private javax.swing.JSeparator jSeparator2;
    private javax.swing.JSeparator jSeparator3;
    private javax.swing.JSeparator jSeparator4;
    private javax.swing.JSeparator jSeparator5;
    private javax.swing.JSeparator jSeparator6;
    private javax.swing.JTabbedPane jTabbedPane5;
    private javax.swing.JLabel lblPass;
    private javax.swing.JLabel lblResultG;
    private javax.swing.JLabel lblResultR;
    private javax.swing.JLabel lblTitleCreate;
    private javax.swing.JLabel lblTitleShow;
    private javax.swing.JLabel lblTitleShow1;
    private javax.swing.JLabel lbluser;
    private javax.swing.JList<String> lstDisplay;
    private javax.swing.JList<String> lstDisplayPrivileges;
    private javax.swing.JList<String> lstDisplayThePrivileges;
    private javax.swing.JList<String> lstDisplayUsers;
    private javax.swing.JList<String> lstDisplayUsersPrivileges;
    private javax.swing.JTextField txtName;
    private javax.swing.JTextField txtPass;
    // End of variables declaration//GEN-END:variables
}
