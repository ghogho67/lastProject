package kr.or.ddit.mypage;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.member.member.service.IMemberService;
import kr.or.ddit.util.PartUtil;

@RequestMapping("/mypage")
@Controller
public class mypageController {
	private static final Logger logger = LoggerFactory.getLogger(mypageController.class);

	@Resource(name = "memberService")
	private IMemberService memberService;

	@RequestMapping("/Patient_Info")
	public String Patient_Info() {
		return "mypage/Patient_Info";
	}

	@RequestMapping(path = "/Patient_InfoModification", method = RequestMethod.GET)
	public String Patient_InfoModification() {
		return "mypage/Patient_InfoModification";
	}

	@RequestMapping(path = "/Patient_InfoModification", method = RequestMethod.POST)
	public String Patient_InfoModification(Model model, MultipartFile profile, HttpSession session,
			RedirectAttributes redirectAttributes, HttpServletRequest request,
			@RequestParam(name = "memid") String mem_id, @RequestParam(name = "grade") String grade,
			@RequestParam(name = "pass") String mem_pass, @RequestParam(name = "email") String mem_mail,
			@RequestParam(name = "phone") String mem_phone, @RequestParam(name = "zipcd") String mem_zipcd,
			@RequestParam(name = "addr1") String mem_add1, @RequestParam(name = "addr2") String mem_add2,
	        @RequestParam(name = "pro_relation") String pro_relation, @RequestParam(name = "pro_nm") String pro_nm,
            @RequestParam(name = "pro_phone") String pro_phone)
			throws IllegalStateException, IOException {

		
		String viewName;

		String mem_nm = "";
		String mem_birth = "";
		String mem_gender = "";
		String mem_del = "";
		String mem_grade = "";
		String cw_driver = "";
		String cw_lic = "";
		String mem_photo_path = "";
		String mem_photo_nm = "";
	

		logger.debug("@@@@grade : {} ", grade);
		logger.debug("@@@@mem_pass : {} ", mem_pass);
		logger.debug("@@@@mem_mail : {} ", mem_mail);
		logger.debug("@@@@mem_phone : {} ", mem_phone);
		logger.debug("mem_zipcd : {} ", mem_zipcd);
		logger.debug("mem_add1 : {} ", mem_add1);
		logger.debug("mem_add2 : {} ", mem_add2);

		MemberVo memberVo = null;

		if (profile.getSize() > 0) {
			String fileName = profile.getOriginalFilename();
			String ext = PartUtil.getExt(fileName);

			String uploadPath = PartUtil.getUploadPath();

			String filePath = uploadPath + File.separator + UUID.randomUUID().toString() + ext;

			mem_photo_path = filePath;
			mem_photo_nm = fileName;

			profile.transferTo(new File(filePath));

		}

		if (grade.equals("3")==false) {

			memberVo = new MemberVo(mem_id, mem_nm, mem_birth, mem_gender, mem_pass, mem_phone, mem_add1, mem_add2,
					mem_zipcd, mem_mail, mem_grade, mem_del, mem_photo_path, mem_photo_nm, pro_relation, pro_nm,
					pro_phone, cw_driver, cw_lic);

			int updateCnt = memberService.updateMember(memberVo);

			if (updateCnt != 1) {
				viewName = "redirect:/login";
			}

			viewName = "redirect:/mypage/Patient_Info";
		} else {

			viewName = "redirect:/login";
		}

		return viewName;
	}
	
	
	
	

	@RequestMapping("/Worker_Info")
	public String Worker_Info() {
		return "mypage/Worker_Info";
	}

	@RequestMapping(path = "/Worker_InfoModification", method = RequestMethod.GET)
	public String Worker_InfoModification() {
		return "mypage/Worker_InfoModification";
	}

	@RequestMapping(path = "/Worker_InfoModification", method = RequestMethod.POST)
	public String Worker_InfoModification(Model model, MultipartFile profile, HttpSession session,
			RedirectAttributes redirectAttributes, HttpServletRequest request,
			@RequestParam(name = "memid") String mem_id, @RequestParam(name = "grade") String grade,
			@RequestParam(name = "pass") String mem_pass, @RequestParam(name = "email") String mem_mail,
			@RequestParam(name = "phone") String mem_phone, @RequestParam(name = "zipcd") String mem_zipcd,
			@RequestParam(name = "addr1") String mem_add1, @RequestParam(name = "addr2") String mem_add2)
			throws IllegalStateException, IOException {

		String viewName;

		String mem_nm = "";
		String mem_birth = "";
		String mem_gender = "";
		String mem_del = "";
		String mem_grade = "";
		String cw_driver = "";
		String cw_lic = "";
		String mem_photo_path = "";
		String mem_photo_nm = "";
		String pro_relation = "";
		String pro_nm = "";
		String pro_phone = "";

		logger.debug("@@@@grade : {} ", grade);
		logger.debug("@@@@mem_pass : {} ", mem_pass);
		logger.debug("@@@@mem_mail : {} ", mem_mail);
		logger.debug("@@@@mem_phone : {} ", mem_phone);
		logger.debug("mem_zipcd : {} ", mem_zipcd);
		logger.debug("mem_add1 : {} ", mem_add1);
		logger.debug("mem_add2 : {} ", mem_add2);

		MemberVo memberVo = null;

		if (profile.getSize() > 0) {
			String fileName = profile.getOriginalFilename();
			String ext = PartUtil.getExt(fileName);

			String uploadPath = PartUtil.getUploadPath();

			String filePath = uploadPath + File.separator + UUID.randomUUID().toString() + ext;

			mem_photo_path = filePath;
			mem_photo_nm = fileName;

			profile.transferTo(new File(filePath));

		}

		if (grade.equals("3")) {

			memberVo = new MemberVo(mem_id, mem_nm, mem_birth, mem_gender, mem_pass, mem_phone, mem_add1, mem_add2,
					mem_zipcd, mem_mail, mem_grade, mem_del, mem_photo_path, mem_photo_nm, pro_relation, pro_nm,
					pro_phone, cw_driver, cw_lic);

			int updateCnt = memberService.updateMember(memberVo);

			if (updateCnt != 1) {
				viewName = "redirect:/login";
			}

			viewName = "redirect:/mypage/Worker_Info";
		} else {

			viewName = "redirect:/login";
		}

		return viewName;
	}

	@RequestMapping("/Admin_Info")
	public String Admin_Info() {
		return "mypage/Admin_Info";
	}

}