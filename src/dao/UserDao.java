package dao;

import beans.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.C3p0Utils;
import utils.Page;

import java.sql.SQLException;
import java.util.List;

public class UserDao {

    //统计用户记录数
    public int getAllUserCount() {
        String sql = "select count(*) from user";
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        Number num = 0;
        try {
            num = (Number) runner.query(sql, new ScalarHandler());
        } catch (SQLException e) {
            //T0D0 Auto-generated catch block
            e.printStackTrace();
        }
        return num.intValue();
    }


    public Page<User> findAllByPage(int pageIndex, int pageSize) {
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "select * from user limit ?,?";
        List<User> list = null;
        try {
            list = (List<User>) runner.query(sql, new BeanListHandler(User.class), new Object[]{(pageIndex - 1) * pageSize, pageSize});
        } catch (SQLException e) {
            //T0D0 Auto-generated catch block
            e.printStackTrace();
        }
        Integer count = this.getAllUserCount();
        Page<User> result = new Page<User>();
        result.setPage(pageIndex);
        result.setRows(list);
        result.setSize(pageSize);
        result.setTotal(count);
        return result;
    }


    public User find(String id) {
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "SELECT * FROM user WHERE id=?";
        User user = null;
        try {
            user = (User) runner.query(sql, new BeanHandler(User.class), new Object[]{id});
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }


    public void insert(User user) {
        String sql = "insert into user (username, password) values (?, ?)";
        try {
            QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
            // 直接执行插入操作，如果用户名已存在，会抛出异常
            int i = runner.update(sql, user.getUsername(), user.getPassword());
            if (i > 0) {
                System.out.println("插入成功");
            } else {
                System.out.println("插入失败");
            }
        } catch (SQLException e) {
            // 捕获异常，判断是否是主键冲突
            if (e.getErrorCode() == 1062) {
                System.out.println("用户名已被注册，请重新输入");
            } else {
                e.printStackTrace();
            }
        }
    }


    public User finduser(String username) {
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "SELECT * FROM user WHERE username=?";
        User user = null;
        try {
            user = (User) runner.query(sql, new BeanHandler(User.class), new Object[]{username});
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }



    public User getUserByUsernameAndPassword(String username, String password) {
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
        User user = null;
        try {
            user = runner.query(sql, new BeanHandler<>(User.class), username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    //更改设置
    public void updateUser(User user) {
        String sql = "UPDATE user SET username = ?, address = ?, signature = ?, a1 = ?, a2 = ?, a3 = ?, a4 = ?, a5 = ?, a6 = ?, b1 = ?, b2 = ?, b3 = ?, c1 = ?, c2 = ?, c3 = ?, c4 = ?, c5 = ?, c6 = ?, c7 = ?, c8 = ?, c9 = ?, c10 = ?, c11 = ?, c12 = ?, c13 = ?, c14 = ?, c15 = ?, c16 = ?, c17 = ?, d1 = ?, d2 = ?, d3 = ?, d4 = ?, steamurl=? WHERE id = ?";
        try {
            QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
            int i = runner.update(sql, user.getUsername(), user.getAddress(), user.getSignature(), user.getA1(), user.getA2(), user.getA3(), user.getA4(), user.getA5(), user.getA6(), user.getB1(), user.getB2(), user.getB3(), user.getC1(), user.getC2(), user.getC3(), user.getC4(), user.getC5(), user.getC6(), user.getC7(), user.getC8(), user.getC9(), user.getC10(), user.getC11(), user.getC12(), user.getC13(), user.getC14(), user.getC15(), user.getC16(), user.getC17(), user.getD1(), user.getD2(), user.getD3(), user.getD4(), user.getSteamurl(), user.getId());
            if (i > 0) {
                System.out.println("su");
            } else {
                System.out.println("fa");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //删除账户
    public void deleteUserById(int id) {
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "DELETE FROM user WHERE id = ?";
        try {
            runner.update(sql, id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //修改密码
    public void updatePassword(String username, String newPassword) {
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "UPDATE user SET password = ? WHERE username = ?";
        try {
            runner.update(sql, newPassword, username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    //修改密码判断
    public boolean validateUser(String username, String oldPassword) {
        QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
        User user = null;
        try {
            user = runner.query(sql, new BeanHandler<>(User.class), username, oldPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user != null;
    }





}


































