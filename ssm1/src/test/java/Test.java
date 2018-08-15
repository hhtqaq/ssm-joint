import com.ecjtu.bean.User;
import com.ecjtu.dao.UserMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * 测试dao曾工作
 * 推荐spring的项目就可以使用spring的单元测试，可以自动注入我们
 * 需要的组件
 * 1、导入springtest模块
 * 2、导入ContextConfiguration指定spring的配置文件位置
 * 3、直接Autowired
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class Test {
    @Autowired
    UserMapper userMapper;
    //批量的sqlsession
    @Autowired
    SqlSession sqlSession;
    @org.junit.Test
    public void testCRUD(){
        System.out.println(userMapper);
        //1\测时插入
        User user = new User();
        user.setUsername("qq");
        user.setPassword("ww");
        userMapper.insertSelective(user);
    }
    @org.junit.Test
    public void testfindAll(){
        System.out.println(userMapper);
        User user = userMapper.selectByPrimaryKey(1);
        System.out.println(user);
        List<User> allUser = userMapper.findAllUser();
        System.out.println(allUser);
    }

    /**
     * 批量操作
     */
    @org.junit.Test
    public void insertBatch(){
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        for (int i = 0; i < 200; i++) {
            User user = new User();
            user.setUsername("hht"+i);
            user.setPassword("ww");
            mapper.insertSelective(user);
        }

    }
}
