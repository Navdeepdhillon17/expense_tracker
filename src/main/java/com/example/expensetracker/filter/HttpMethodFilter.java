package com.example.expensetracker.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletRequestWrapper;
import java.io.IOException;

@WebFilter("/*")  // Applies to all URLs
public class HttpMethodFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;

        // Convert POST-with-_method to actual HTTP method
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String method = request.getParameter("_method");
            if ("DELETE".equalsIgnoreCase(method)) {
                req = new HttpMethodRequestWrapper(request, "DELETE");
            }
        }

        chain.doFilter(req, res);
    }

    // Wrapper to override the HTTP method
    private static class HttpMethodRequestWrapper extends HttpServletRequestWrapper {
        private final String method;

        public HttpMethodRequestWrapper(HttpServletRequest request, String method) {
            super(request);
            this.method = method;
        }

        @Override
        public String getMethod() {
            return this.method;
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void destroy() {}
}

