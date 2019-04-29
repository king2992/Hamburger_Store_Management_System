/**
 * 덧글 ajax 스크립트 소스파일 -우형이-
 */
//댓글 목록 

var number = $('.board_no').val(); //게시글 번호

$('[name=commentBtn]').click(function(){
	var insertData = $('[name=insertForm]').serialize();// serialize() : 표준  URL-encoded 표기법으로 텍스트 문자열을 만듭니다.

	commentInsert(insertData);
	
	
	
});

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
            var a ='';
            
            $.each(data.result, function(index, value){
//            	대댓글일 경우 출력폼
            	if (value.coDepth == 1) {
            		a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:10px;">';
            		a += '<div class="commentInfo'+value.coNumber+'">'+'작성일: '+value.coDate+'/ 작성자: '+value.id;
            		a += '<a onclick="commentUpdate('+value.coNumber+',\''+value.content+'\');">수정</a>';
            		a += '<a onclick="commentDelete('+value.coNumber+');">삭제</a></div>';
            		a += '<div class="commentContent'+value.coNumber+'"> <p>'+value.content+'</p>';
            	} 
            	// 댓글일 경우
            	else {
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 10px;">';
                a += '<div class="commentInfo'+value.coNumber+'">'+'작성일 : '+value.coDate+' / 작성자 : '+value.id;
                a += '<a onclick="commentUpdate('+value.coNumber+',\''+value.content+'\');">수정 </a>';
                a += '<a onclick="commentReply('+value.coGroup+');">답글</a>';
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
    a += '<input type="text" class="form-control" name="content_'+coNumber+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUp('+coNumber+');">수정</button> </span>';
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




