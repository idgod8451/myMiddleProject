package handlers.corp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import corp.Corp;
import corp.CorpService;
import handlers.Handler;


public class CorpHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		//get=처음에 회사 정보 등록 페이지로 이동
		String view = "/corp/info.jsp";

		//post=처음 회사 정보 등록(db에 추가)
		if(request.getMethod().equals("POST")) {
			String corpid = (String)request.getSession().getAttribute("loginId");
			String corp_nm = request.getParameter("corp_nm");
			//우편번호 + 주소 +상세주소
			String corp_addr = request.getParameter("p_code")+" "+request.getParameter("addr")+" "+request.getParameter("addrdet");
			String busi_no=request.getParameter("busi_no");
			
			//System.out.println("corpid: "+corpid+" /corp_nm: "+corp_nm+" /corp_addr: "+corp_addr+" /busi_no: "+busi_no);
			
			CorpService service = new CorpService();
			// 기업 추가 서비스 수정
			service.addNewCorp(new Corp(0,corpid,corp_nm,corp_addr,busi_no));
			view = "redirect:/mem/corpinfo.do";
		}else {
			String corpid = (String)request.getSession().getAttribute("loginId");
			CorpService service = new CorpService();
			Corp c = service.getByCorpId(corpid);
			System.out.println(c);
			if(c != null) {
				request.setAttribute("c", c);
			}
			request.setAttribute("view", "/corp/add.jsp");
		}
		return view;
	}

}
