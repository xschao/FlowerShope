package cn.jjxy.util;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

/**
 * 自定义标签的使用
 * @author Steven
 *
 */
public class MyTag extends TagSupport {

	@Override
	public int doStartTag() throws JspException {
		JspWriter out = super.pageContext.getOut();
		
		try {
			out.print("<span>这个是自定义标签输出的内容<span>");
			out.print("<h1>这个是自定义标签输出的大标题<h1>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return super.doStartTag();
	}

}
