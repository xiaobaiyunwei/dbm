package com.devops.rad3.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;


public class DispatchServlet extends HttpServlet {
	private Logger log = Logger.getLogger(DispatchServlet.class);
	private static int num =0;

	private static final long serialVersionUID = 8987064845052761921L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
        process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
        process(req, resp);
	}

	@Override
	public void init() throws ServletException {
		log.debug("--------->>>> init ");
		super.init();
	}

	@Override
	public void destroy() {
		log.debug("--------->>>> destroy ");
		super.destroy();
	}

	private void process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
    
		StringBuffer uri = new StringBuffer("/WEB-INF/jsp");
		String reqUri = req.getRequestURI();
		String contextPath = req.getContextPath();
		uri.append(reqUri.replaceFirst(contextPath, "").replace(".shtm", ".jsp").replace(".jswf", ".swf"));
		log.debug("--->process to: " + uri.toString());
        req.getRequestDispatcher(uri.toString()).forward(req, resp);
	}
}
