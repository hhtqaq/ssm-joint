import com.ecjtu.bean.User;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;
//spring的测试需要servlet3.0以上
@RunWith(SpringJUnit4ClassRunner.class)
//webioc也能拿过来
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:springmvc.xml"})
public class TestMVC {
    //传入springmvc的ioc
    @Autowired
    WebApplicationContext context;
    //虚拟的mvc请求，获取处理结果
    MockMvc mockMvc;

    @Before
    public void initMockMvc() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testpage() throws Exception {
        //模拟发送请求  并拿到返回值
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/listUser")
                .param("currentpage", "3")).andReturn();
        //请求域中会有pageinfo的信息 取出pageinfo进行验证
        //拿到结果中的request信息
        MockHttpServletRequest request = result.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码" + pageInfo.getPageNum());
        System.out.println("总页码" + pageInfo.getPages());
        System.out.println("总记录数" + pageInfo.getTotal());
        System.out.println("在页面需要连续显示的页码");
        int[] nums = pageInfo.getNavigatepageNums();
        for (int num : nums) {
            System.out.print("" + num);
        }
        //获取员工数据
        List<User> users = pageInfo.getList();
        for (User user : users
                ) {
            System.out.println("ID"+user.getId()+" Name"+user.getUsername()+" password"+user.getPassword());
        }
    }
}
