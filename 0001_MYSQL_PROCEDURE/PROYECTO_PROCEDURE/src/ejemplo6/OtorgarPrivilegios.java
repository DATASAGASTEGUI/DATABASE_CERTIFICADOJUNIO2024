package ejemplo6;

import java.sql.Connection;
import javax.swing.DefaultListModel;

public class OtorgarPrivilegios extends javax.swing.JFrame {

    Connection conexion = Metodos.obtenerConexion();
    DefaultListModel dlm1 = new DefaultListModel();
    DefaultListModel dlm2 = new DefaultListModel();
    
    public OtorgarPrivilegios() {
        initComponents();
        lstMostrarUsuarios.setModel(dlm1);
        lstPrivilegios.setModel(dlm2);
        cargarListaMostrarUsuarios();
    }
    
    public void cargarListaMostrarUsuarios() {
        Metodos.showUsers(conexion, dlm1);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        lstMostrarUsuarios = new javax.swing.JList<>();
        jScrollPane2 = new javax.swing.JScrollPane();
        lstPrivilegios = new javax.swing.JList<>();
        cmdOtorgarPrivilegios = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setBackground(new java.awt.Color(255, 255, 255));
        jLabel1.setFont(new java.awt.Font("Courier New", 0, 14)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(0, 0, 0));
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("OTORGAR Y REVOCAR PRIVILEGIOS");

        jScrollPane1.setViewportView(lstMostrarUsuarios);

        lstPrivilegios.setModel(new javax.swing.AbstractListModel<String>() {
            String[] strings = { "ALL", "INSERT", "SELECT", "UPDATE", "DELETE", "ALTER", "CREATE", "DROP" };
            public int getSize() { return strings.length; }
            public String getElementAt(int i) { return strings[i]; }
        });
        jScrollPane2.setViewportView(lstPrivilegios);

        cmdOtorgarPrivilegios.setText("ASIGNAR PRIVILEGIOS");
        cmdOtorgarPrivilegios.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cmdOtorgarPrivilegiosActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel1, javax.swing.GroupLayout.DEFAULT_SIZE, 400, Short.MAX_VALUE)
            .addGroup(layout.createSequentialGroup()
                .addGap(51, 51, 51)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 84, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 84, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(71, 71, 71))
            .addGroup(layout.createSequentialGroup()
                .addGap(118, 118, 118)
                .addComponent(cmdOtorgarPrivilegios)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jLabel1)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 143, Short.MAX_VALUE))
                .addGap(32, 32, 32)
                .addComponent(cmdOtorgarPrivilegios)
                .addContainerGap(135, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void cmdOtorgarPrivilegiosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cmdOtorgarPrivilegiosActionPerformed
       int i = lstMostrarUsuarios.getSelectedIndex();
       String usuario = (String)dlm1.getElementAt(i);
       
       int[] privilegios = lstPrivilegios.getSelectedIndices();
       System.out.println(privilegios[0]);
       
       String[] privilegiosUsuarios = new String[privilegios.length];
       int j = 0;
       for(int index: privilegios) {
           String usuario1 = (String)dlm2.getElementAt(index);
           privilegiosUsuarios[j] = usuario1;
           j++;
       }
       for(String s: privilegiosUsuarios) {
           System.out.println(s);
       }
       
       Metodos.CrearPrivilegiosUsuarioNuevo(conexion, usuario, privilegiosUsuarios);
    }//GEN-LAST:event_cmdOtorgarPrivilegiosActionPerformed

    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new OtorgarPrivilegios().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton cmdOtorgarPrivilegios;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JList<String> lstMostrarUsuarios;
    private javax.swing.JList<String> lstPrivilegios;
    // End of variables declaration//GEN-END:variables
}
