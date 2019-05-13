package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.kopo.model.Comment;
import kr.ac.kopo.service.CommentService;

@RestController
//responseBody 를 쓰지 않아도 됨
@RequestMapping("/comment")
public class CommentController {
	
// @inject @resource 비슷비슷한듯
	@Autowired
	private CommentService commentService;

	@SuppressWarnings("unchecked")
	// @RequestMapping(value="/co.list", method=RequestMethod.GET, produces = "application/json; charset=utf8")
    @RequestMapping(value="/co.list", method=RequestMethod.GET, produces="text/plain;charset=UTF-8") //댓글 리스트
    String commentList(@RequestParam int number,Model model) throws Exception{
		List<Comment> list = commentService.commentList(number);
		JSONObject obj = new JSONObject();
		JSONArray array = new JSONArray();
		for ( int i=0; i<list.size(); i++ ) {
			JSONObject value = new JSONObject();
			value.put("coNumber", list.get(i).getCoNumber());
			value.put("number", list.get(i).getNumber());
			value.put("userId", list.get(i).getUserId());
			value.put("content", list.get(i).getContent());
			value.put("coDate", list.get(i).getCoDate());
			value.put("coGroup", list.get(i).getCoGroup());
			value.put("coOrd", list.get(i).getCoOrd());
			value.put("coDepth",list.get(i).getCoDepth());
			array.add(value);
		}
		obj.put("result", array);
		for ( int i=0; i<list.size(); i++ ) {
			System.out.println(list.toString());
		}
		System.out.println(obj.toString());
        return obj.toString();
    }
  //댓글 작성 
    @RequestMapping("/co.insert")
    //@RequestParam 으로 파라미터값을 가져온다
    int commnetIn(@RequestParam int number, @RequestParam String content, HttpSession session) throws Exception{
        
        Comment comm = new Comment();//인스턴스 생성
        comm.setNumber(number);//설정
        comm.setContent(content);//설정
        comm.setUserId((String) session.getAttribute("user"));
        return commentService.commentInsert(comm);
    }
  //댓글 수정  
    //한글 인코딩 처리 하는거쥐 produces = "application/json; charset=utf8"
    @RequestMapping("/co.update") 
    //(@RequestParam(value="coNumber", defaultValue="false")
     int commentUp(@RequestParam int coNumber, @RequestParam String content) throws Exception{//예외처리
        // new 인스턴스 생성
        Comment comm = new Comment();//호출
        comm.setCoNumber(coNumber);//설정
        comm.setContent(content);//설정
        
        return commentService.commentUpdate(comm);
    }
  //댓글 삭제  
//    {템플릿변수}
    @RequestMapping("/co.delete/{coNumber}") 
    //PathVariable = URL 경로에 변수를 넣어줌
     int commentDel(@PathVariable int coNumber) throws Exception{
        
        return commentService.commentDelete(coNumber);
    }
//계층형 대댓글 추가
    @RequestMapping("/co.reply")
    //@RequestParam 으로 파라미터값을 가져온다
    int comentReply(@RequestParam int number, @RequestParam int coGroup, @RequestParam String content, HttpSession session) throws Exception{
        Comment comm = new Comment();//인스턴스 생성
        comm.setNumber(number);
        comm.setCoGroup(coGroup);
        comm.setContent(content);
        comm.setUserId((String) session.getAttribute("user"));
        return commentService.commentReply(comm);
    }
}
