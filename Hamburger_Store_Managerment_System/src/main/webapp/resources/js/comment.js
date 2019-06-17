/**
 * 덧글 ajax 스크립트 소스파일 -우형이-
 */
//댓글 목록 

var number = $('.board_no').val(); //게시글 번호

$('[name=commentBtn]').click(function(){
	var insertData = $('[name=insertForm]').serialize();// serialize() : 표준  URL-encoded 표기법으로 텍스트 문자열을 만듭니다.
	commentInsert(insertData);
});

var userId = "${view.userId}";
function commentList(){
	console.log('댓글리스트 출력');
    $.ajax({
        url : '/comment/co.list',
        type : 'get',
        data : {number : number},
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType:'JSON',
        success : function(data){
        	console.log(data);
        	console.log(data.userId);
            var a ='';
            $.each(data.result, function(index, value){
//            	대댓글일 경우 출력폼
            	if (value.coDepth == 1 ) {
            		a += '<img style="position:relative; top:55px;" src="/resources/images/comment.png">';
            		a += '<div style="position:relative;">'
            		a += '<div class="comment_content" style="margin-left:40px;">';
            		a += '<div class="commentInfo'+value.coNumber+'">'+'작성일: '+value.coDate+'/ 작성자: '+value.userId;
            		a += '<a onclick="commentUpdate('+value.coNumber+',\''+value.content+'\');">수정</a>';
            		a += '<a onclick="commentDelete('+value.coNumber+');">삭제</a></div>';
            		a += '<div class="commentContent'+value.coNumber+'"> <p>'+value.content+'</p>';
            		a += '</div>';
            	}
            	// 댓글일 경우
            	else {
                a += '<div class="comment_content">';
                a += '<div class="comment_info'+value.coNumber+'">'+'작성일 : '+value.coDate+' / 작성자 : '+value.userId;
                a += '<a onclick="commentReply('+value.coGroup+');">답글</a>';
                a += '<a onclick="commentUpdate('+value.coNumber+',\''+value.content+'\');">수정 </a>';
                a += '<a onclick="commentDelete('+value.coNumber+');"> 삭제 </a> </div>';
                a += '<div class="commentContent'+value.coNumber+'"> <p>'+value.content+'</p>';
                a += '</div></div>';
                a += '<div class="reply'+value.coNumber+'"></div>';
            	}
            });
            $(".commentList").html(a);
        },
        error : function(){
        	console.log('error');
        	
        },
        complete : function(){
        	console.log('complete');
        }
    });
};

//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : '/comment/co.insert',
        type : 'post',
        data : insertData,
        success : function(data){
        	console.log(data);
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        },
    });
};
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(coNumber, content){
    var a ='';
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" style="width:500px; flex:inherit;" name="content_'+coNumber+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button"  onclick="commentUp('+coNumber+');">수정</button> </span>';
    a += '</div>';
    $('.commentContent'+coNumber).html(a);
}
//댓글 수정
function commentUp(coNumber){
    var updateContent = $('[name=content_'+coNumber+']').val();
    $.ajax({
        url : '/comment/co.update',
        type : 'post',
        data : {'content' : updateContent, 'coNumber' : coNumber},
        success : function(data){
            if(data == 1)
            	commentList(number); //댓글 수정후 목록 출력 
        }
    });
}
//댓글 삭제 
function commentDelete(coNumber){
    $.ajax({
        url : '/comment/co.delete/'+coNumber,
        type : 'post',
        success : function(data){
            if(data == 1)
            	commentList(number); //댓글 삭제후 목록 출력 
        }
    });
}
//페이지 로딩시 댓글 목록 출력
$(document).ready(function(){
    commentList();
});

function commentReply(coGroup) {
	
	var re = '';
	re += '<input type="hidden" name="coGroup_'+coGroup+'" value="'+coGroup+'">';
	re += '<div>';
	re += '<img style="float:left; position:relative; top:13px;" src="/resources/images/comment.png">';
	re += '<input class="reply" id="reply_add" placeholder="답글을 입력하세요">';
	re += '<span><button class="replyBtn btn btn-danger" type="button" onclick="replyAdd('+coGroup+')">답글등록</button><span>';
	re += '</div>';
    $('.reply'+coGroup).html(re);
	console.log(coGroup+'>>>>>>>>>>>>>>>>>>대댓글번호');
	
	
	$('.replyBtn').click(function(){
		$('#number').css('margin-left','74px');
	});
	
}

function replyAdd(coGroup,content,insertData) {
	
	var content = $("#reply_add").val();
	console.log('>>>>>>>>>>>>>>>>>>>>>>글번호'+number);
	$.ajax({
		url : '/comment/co.reply',
		type : 'post',
		data : {number,coGroup,content,insertData}, 
		success : function(data) {
			if(data == 1) {
				commentList(number);
				console.log('대댓글등록');
			}
		}
	});
};