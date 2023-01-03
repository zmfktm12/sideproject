window.onload = () =>{

    const panelNoticeContainer = document.querySelectorAll('.panel-notice-container')
    console.log(panelNoticeContainer); //NodeList객체
    
    // Notice 본문 선택
    let panelNoticeBody = document.querySelectorAll('.panel-notice-body');
    

    // btn-all-close
    const btnAllClose = document.getElementById('btn-all-close');
    // 반복문 순회하면서 해당 Notice 제목 클릭시 콜백 처리
    for(let i=0; i<panelNoticeContainer.length; i++){
        
        panelNoticeContainer[i].addEventListener('click',function(){

            //클릭시 처리 할 일
            console.log('나 클릭'+i);
         
 
            // Notice 제목 클릭시 --> 본문이 보이게끔 --> active 클래스 추가
            panelNoticeBody[i].classList.add('active');
        });
    }

    btnAllClose.addEventListener('click', function(){
        console.log('모두 닫기 버튼 클릭');

        // 버튼 클릭시 처리할 일
        for(let i=0; i<panelNoticeBody.length; i++){
            panelNoticeBody[i].classList.remove('active');
        }
    })
}

