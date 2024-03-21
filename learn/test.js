import javax.swing.*;

class testframe {
    public static void main(String[] args) {
    //1、画一个窗口
    JFrame frame = new JFrame("zxw");
    JPanel panel = new JPanel();
    //2、窗口上画一个组件   文本框 one  two
    JTextField oneField = new JTextField(10);
    JTextField twoField = new JTextField(10);
    JTextField resultField = new JTextField(10);
    //3、在窗口上画组件     按钮  + — * /
    JButton add = new JButton("+");
    JButton substract = new JButton("-");
    JButton multiply = new JButton("*");
    JButton divide = new JButton("/");
    //3.1  摆放组件位置
    panel.setLayout(null);
    oneField.setBounds(10,10,150,20);
    twoField.setBounds(10,40,150,20);
    add.setBounds(10,70,50,20);
    substract.setBounds(70,70,50,20);
    multiply.setBounds(130,70,50,20);
    divide.setBounds(200,70,50,20);
    resultField.setBounds(10,150,150,20);
    //4、将组件组合在一起
    panel.add(oneField);
    panel.add(twoField);
    panel.add(add);
    panel.add(substract);
    panel.add(multiply);
    panel.add(divide);
    panel.add(resultField);
    frame.add(panel);
    //5、在窗口上画组件     文本框
    add.addActionListener(e->{
    //
    int one = Integer.parseInt(oneField.getText());
    int two = Integer.parseInt(twoField.getText());
    //将结果存回去+
    resultField.setText(String.valueOf(one+two));
});
/**       add.addActionListener(e->{
 //
 int one = Integer.parseInt(oneField.getText());
 int two = Integer.parseInt(twoField.getText());
 //将结果存回去-
 resultField.setText(String.valueOf(one-two));
 });   **/
//6、让窗口展示出来
frame.setBounds(500,260,300,300);
frame.setVisible(true);
frame.setDefaultCloseOperation(3);//设置默认关闭程序
}
}
