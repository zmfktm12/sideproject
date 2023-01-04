<HTML>
<HEAD>
<META http-equiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" >
	<style>
    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  </style>
<link rel="stylesheet" href="./accordion_1.css">
</HEAD>
<BODY>
	<div class="container">
		<div class="input-form-backgroud row">
      		<div class="input-form col-md-12 mx-auto">
		<h3 style="text-align:center; padding-top:50px" >
            <a href="index.html">회원가입</a>
            <small class="text-muted">myFirst_SideProject_2023</small>
        </h3>
		<form class="validation-form" METHOD="post"  ACTION="insert_result.php" >
          <div class="row">

            <div class="col-md-6 mb-3">
              <label for="userID">ID</label>
              <input type="text" class="form-control" NAME="userID" required>
              <div class="invalid-feedback">
                ID를 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" NAME="name" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
            </div>
          </div>

          <div class="mb-3">
            <label for="birthYear">생일</label>
            <input type="text" class="form-control" NAME="birthYear" required>
            <div class="invalid-feedback">
              생일을 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="addr">지역</label>
            <input type="text" class="form-control" NAME="addr" required>
            <div class="invalid-feedback">
              주소를 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="mobile1">휴대폰</label>
            <input type="text" class="form-control" NAME="mobile1">
          </div>

          <div class="mb-3">
            <label for="mobile2">전화번호</label>
            <input type="text" class="form-control" NAME="mobile2">
          </div>

          <div class="mb-3">
            <label for="height">신장</label>
            <input type="text" class="form-control" NAME="height">
          </div>
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" type="submit" VALUE="회원 입력">가입 완료</button>
        </form>
      </div>
    </div>
</div>
</BODY>


</HTML>