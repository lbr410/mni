<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.container{
        width: 300vw;
        transition: transform 0.5s;
    }
    .inner{
        width: 100vw;
        float: left;
    }
    .inner img{
        width: 100%;
    }
    
    
    label{
        z-index: 10;
    }
    
#buttonDeco{
    width: 22px;
    height: 22px;
    font-size: 12px;
    color: black;
    border: 0;
    background-color: white;
    border: 1px #ff7f50 solid;
    border-radius: 5px;
}
#buttonDeco:focus {
    background-color:#ff7f50;
    color:white;
    outline: none;
    border-radius: 5px;
}

.btnDiv{
	display:inline-block;
	margin-left: 300px;
}
</style>
</head>
<body>
<div style = "overflow: hidden">
    <div class = "container">
        <div class = "inner">
           
            <img src = "img/002.jpg">
            
        </div>
        <div class = "inner">
           
            <img src = "img/003.jpg">
            
        </div>
        <div class = "inner">
           
            <img src = "img/004.jpg">
            
        </div>
    </div>
    </div >
    <div class="btnDiv">
    <button class = "button1" id="buttonDeco" >1</button>
    <button class = "button2" id="buttonDeco">2</button>
    <button class = "button3" id="buttonDeco">3</button>
    </div>
    <script>
        
    document.querySelector('.button1').addEventListener('click', function(){
        document.querySelector('.container').style.transform = 'translate(0vw)';
     });
        
    document.querySelector('.button2').addEventListener('click', function(){
        document.querySelector('.container').style.transform = 'translate(-100vw)';
     });
        
        document.querySelector('.button3').addEventListener('click', function(){
        document.querySelector('.container').style.transform = 'translate(-200vw)';
     });
</script>
</body>
</html>