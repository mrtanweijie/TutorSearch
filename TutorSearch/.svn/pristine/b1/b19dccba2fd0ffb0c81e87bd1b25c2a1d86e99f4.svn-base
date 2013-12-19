package tan.code.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tan.code.model.PTJop;
import tan.code.service.PTJobService;

@Controller
@RequestMapping("/ptjob")
public class PTJopController {
	private static Logger logger =Logger.getLogger(PTJopController.class);
	private PTJobService ptJobService;
	
	public PTJobService getPtJobService() {
		return ptJobService;
	}

	public void setPtJobService(PTJobService ptJobService) {
		this.ptJobService = ptJobService;
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(PTJop ptjob) {
		if (ptJobService.add(ptjob)) {
			
			logger.info("∑¢≤ººÊ÷∞:"+ptjob.getCompany());
			
			return "success.jsp";
		}
		else {
			return "error.jsp";
		}
		//return null;
	}
}
