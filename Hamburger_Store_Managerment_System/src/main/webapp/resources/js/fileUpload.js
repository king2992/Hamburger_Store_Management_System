/**
 * 
 */

// Handlebars 파일템플릿 컴파일
var fileTemplate = Handlebars.compile($("#fileTemplate").html());
  
// 첨부파일 drag & drop 영역 선택자
var fileDropDiv = $(".fileDrop");

// 전체 페이지 첨부파일 drag & drop 기본 이벤트 방지
$(".content-wrapper").on("dragenter drageover drop", function(event) {
	event.preventDefault();
});

// 첨부파일 영역 drag & drop 기본 이벤트 방지
fileDropDiv.on("dragenter dragover", function(event){
	event.preventDefault();
});

fileDropDiv.on("drop", function(event) {
	event.preventDefault();
	// drop 이벤트 발생시 전달된 파일 데이터
	var files = event.originalEvent.dataTransfer.files;
	// 단일 파일 데이터만을 처리하기 때문 첫번째 파일만 저장
	var file = files[0];
	// formData 객체 생성, 파일데이터 저장
	var formData = new FormData();
	formData.append("file", file);
	// 파일 업로드 ajax 통신 메서드 호출
	uploadFile(formData);
	filesSubmit(formData);
});

$(document).on('dragenter dragover drop', '.content-wrapper', function(event) {
	event.preventDefault();
});

$(document).on("dragenter dragover", function(event) {
	event.preventDefault();
});

$(document).on('drop', '.fileDrop', function(event) {
	event.preventDefault();
	// drop 이벤트 발생시 전달된 파일 데이터
	var files = event.originalEvent.dataTransfer.files;
	// 단일 파일 데이터만을 처리하기 때문 첫번째 파일만 저장
	var file = files[0];
	// formData 객체 생성, 파일데이터 저장
	var formData = new FormData();
	formData.append("file", file);
	// 파일 업로드 ajax 통신 메서드 호출
	uploadFile(formData);

});

// 파일 업로드 ajax 통신
function uploadFile(formData) {
	$.ajax({
		url : "/review/file/upload",
		data : formData,
		dataType : "text",
		// processData : 데이터를 일반적인 query string 으로 변환처리할 것인지 결정
		// 기본값은 true, application/x-www-form-urlencoded 타입
		// 자동변환 처리하지 않기 위해 false
		processData : false,
		// contentType : 기본값은 true, application/x-www-form-urlencoded 타입
		// multipart/form-data 방식으로 전송하기 위해 false
		contentType : false,
		type : "POST",
		success : function (data) {
			printFiles(data);// 첨부파일 출력 메서드 호출
			$(".noAttach").remove();
		
		}
	});
}

// 첨부파일 출력
function printFiles(data) {
	// 파일 정보 처리
	var fileInfo = getFileInfo(data);
	// Handlebars 파일 템플릿에 파일 정보들을 바인딩하고 HTML 생성
	var html = fileTemplate(fileInfo);
	// Handlebars 파일 템플릿 컴파일을 통해 생성된 HTML을 DOM에 주입
	$(".uploadedFileList").append(html);
	// 이미지 파일인 경우 파일 템플릿에 lightbox 속성 추가
	if (fileInfo.fullName.substr(12, 2) === "s_") {
		// 마지막에 추가된 첨부파일 템플릿 선택자
		var that = $(".uploadedFileList").last();
		// lightbox 속성 추가
		that.find(".mailbox-attachment-name").attr("data-lightbox", "uploadImages");
		// 파일 아이콘에서 이미지 아이콘으로 변경
		that.find(".fa-paperclip").attr("class", "fa fa-camera");
	}
}

// 게시글 입력/수정 submit 처리시에 첨부파일 정보도 함깨 처리
function filesSubmit(that) {
	var str = "";
	$(".uploadedFileList .delBtn").each(function (index) {
		 str += "<input type='hidden' name='files[" + index + "]' value='" + $(this).attr("href") + "'>"
	});	
	
	that.append(str);
	that.get(0).submit();
}

// 파일 삭제(입력페이지) : 첨부파일만 삭제처리
function deleteFileWrtPage(that) {
	var url = "/review/file/delete";
	deleteFile(url, that);
}

// 파일삭제(수정페이지) : 서버에 저장된 첨부파일과 DB에 저장된 첨부파일 정보 삭제처리
function deleteFileModPage(that, number) {
	var url = "/review/file/delete/" + number;
	deleteFile(url, that);
}

// 파일 삭제 ajax 통신 
function deleteFile(url, that) {
	$.ajax({
		url : url,
		type : "POST",
		data : { fileName: that.attr("href")},
		dataType : "text",
		success : function (result) {
			if (result === "DELETED") {
				Swal.fire({
					  position: 'top-end',
					  type: 'success',
					  title: 'AttachFile Deleted!',
					  showConfirmButton: false,
					  timer: 1500
					})
			//	alert("삭제되었습니다.");
				that.parents("li").remove();
			}
		}
	});
}

// 파일 정보 처리
function getFileInfo(fullName) {
	
	var originalFileName; // 화면에 출력할 파일명
	var imgSrc; 		  // 썸네일 or 파일아이콘 이미지 파일 출력 요청 URL
	var originalFileUrl;  // 원본파일 요청 URL
	var uuidFileName;	  // 날짜경로를 제외한 나머지 파일명 (UUID_파일명.확장자)
	
	// 이미지 파일이면
	if (checkImageType(fullName)) {
		imgSrc = "/review/file/display?fileName=" + fullName; // 썸네일 이미지 링크
		uuidFileName = fullName.substr(14);
		var originalImg = fullName.substr(0, 12) + fullName.substr(14);
		// 원본 이미지 요청 링크
		originalFileUrl = "/review/file/display?fileName=" + originalImg;
	} else {
		imgSrc = "/resources/upload/files/file-icon.gif"; // 파일 아이콘 이미지 링크
		uuidFileName = fullName.substr(12);
		// 파일 다운로드 요청 링크
		originalFileUrl = "/file/display?fileName=" + fullName;
	}
	originalFileName = uuidFileName.substr(uuidFileName.indexOf("_") + 1);
	
	return {originalFileName: originalFileName, imgSrc: imgSrc, originalFileUrl: originalFileUrl, fullName: fullName}
}

// 이미지 파일 유무 확인
function checkImageType(fullName) {
	var pattern = /jpg$|gif$|png$|jpge$/i;
	return fullName.match(pattern);
}

// 파일 삭제 버튼 클릭 이벤트
$(document).on("click", ".delBtn", function(event) {
	event.preventDefault();
	var that = $(this);
	deleteFileWrtPage(that);
});

function getFiles(number) {
	$.getJSON("/review/file/list/" + number, function (list) {
		if (list.length === 0) {
			$(".uploadedFileList").html("<span class='noAttach'>첨부파일이 없습니다.</span>");
		}
		$(list).each(function () {
			printFiles(this);
		})
	});
}
// 현재 게시글 번호
// 첨부파일 삭제 버튼 클릭 이밴트
$(document).on("click", ".delBtn", function(event) {
	event.preventDefault();
		var that = $(this);
		deleteFileModPage(that, number);
});

//첨부파일 목록

//getFiles(number);
$(document).ready(function() {
//	var number = $('#number').val();
//	if(number) {
//		getFiles(number);
//	}
	
	$("#writeForm").submit(function(event) {
		event.preventDefault();
		
		Swal.fire({
			  type: 'success',
			  title: '게시글이 등록 되었습니다!',
			  timer: 1500
		})
		
		var that = $(this);
		filesSubmit(that);
	});
});