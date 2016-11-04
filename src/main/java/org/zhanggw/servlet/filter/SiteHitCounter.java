package org.zhanggw.servlet.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;



public class SiteHitCounter implements Filter {

	private long hitCount;
	
	@Override
	public void destroy() {
		
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		hitCount++;
		arg2.doFilter(arg0, arg1);
		System.out.println("Õ¯’æ∑√Œ Õ≥º∆£∫"+ hitCount );
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
		hitCount = 0;
	}

}
