<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <script src="https://kit.fontawesome.com/fca98d1848.js" crossorigin="anonymous"></script>
    
    <style>
        * {font-family: 'Noto Sans KR', sans-serif;}
        div{box-sizing: border-box;}
        .wrap{
            /*border: 1px solid red;*/
            width: 1000px;
            padding-top: 20px;
            margin: auto;
        }
        /*가장 상단, 과정(작은글씨)*/
        #order-process{
            /*border: 1px solid blue;*/
            width: 100%;
            padding-right: 30px;
            text-align: right;
        }
        #order-process span{font-size: 10px;}
        #order-header h3{font-weight: 800; padding-left: 15px;}
        
        /*주문완료 정보 영역*/
        .orderComplete-area{
            /*border: 1px solid red;*/
            width: 500px;
            height: auto;
            margin: auto;
        }
        #orderComplete-header{
            text-align: center;
            margin: 40px 0 60px 0;
        }
        #orderComplete-header i{
            font-size: 50px;
            color: rgb(155,213,189);
            margin-bottom: 20px;
        }
        #orderComplete-info table, #payment-info table{
            margin: auto;
            margin-top: 20px;
        }
        #orderComplete-info th, #payment-info th{
            width: 130px; 
            vertical-align: top;
            font-size: 15px;
        }
        #orderComplete-info td, #payment-info td{width: 310px;}
        #orderComplete-info span, #payment-info span{
            font-size: 13px;
        }
        .order-product span, #end-price span{
            display: block;
        }
        /*결제 금액 정보*/
        #payment-info{
            margin: auto;
            margin-top: 50px;
        }
        #price{
            font-weight: 700;
            color: rgb(155,213,189);
        }
        #payment-info table{
            border-collapse: separate;
            border-spacing: 0 10px;
        }
        /*확인 버튼*/
        #check{
            display: block;
            margin: auto;
            width: 130px;
            height: 30px;
            background-color: rgb(155,213,189);
            color: white;
            font-weight: 800;
        }
    </style>
    </head>
    <body>
        <div class="wrap">
            <div id="order-process">
                <span>01장바구니 &gt; </span>
                <span style="color: rgb(52,206,117);">02주문서/결제 &gt;</span>
                <span>03주문완료</span>
            </div>
            <div id="order-header">
                <h3>주 &nbsp; 문 &nbsp; 완 &nbsp; 료</h3>
                <hr>
            </div>
    
            <!-- 주문완료 정보 영역 -->
            <div class="orderComplete-area">
                <div id="orderComplete-header">
                    <i class="far fa-check-circle"></i>
                    <!-- 카드, 무통장 출력문구 다름-->
                    <!--<h4 style="font-weight: 800;">입금 확인 후 구매가 확정됩니다.</h4>-->
                    <h4 style="font-weight: 800;">주문이 완료되었습니다.</h4>
                </div>
    
                <!-- 주문 정보 -->
                <div id="orderComplete-info">
                    <span style="font-size: 18px; font-weight: 800;">주문정보</span>
                    <hr style="margin-top: 5px;">
    
                    <table>
                        <tr>
                            <th>주문번호</th>
                            <td><span>1234567891234</span></td>
                        </tr>
                    </table>
    
                    <table>
                        <tr>
                            <th rowspan="4">배송정보</th>
                            <td>
                                <span>홍길동 / 010-2345-6789</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>77766</span>
                                <span>서울특별시 강남구 테헤란로 14길 6 남도빌딩</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>배송요청메세지 : </span>
                                <span>샬라샬라샬라</span>
                            </td>
                        </tr>
                    </table>
    
                    <table>
                        <tr>
                            <th rowspan="4">결제수단</th>
                            <td><span>신용카드</span></td>
                        </tr>
                        <tr>
                            <td>
                                <span>결제금액 : </span>
                                <span>32,000</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>할부 : </span>
                                <span>일시불</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>결제자 : </span>
                                <span>홍길동</span>
                            </td>
                        </tr>
                    </table>
    
                    <!-- 무통장 입금 -->
                    <!--
                    <table>
                        <tr>
                            <th rowspan="5">결제수단</th>
                            <td><span>신용카드</span></td>
                        </tr>
                        <tr>
                            <td>
                                <span>입금은행 : </span>
                                <span>신한은행 110-444-555555555</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>예금주명 : </span>
                                <span>(주)왓츠인마이볼</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>입금금액 : </span>
                                <span>32,000</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>입금자명 : </span>
                                <span>홍길동</span>
                            </td>
                        </tr>
                    </table>
                    -->
    
                    <table>
                        <tr>
                            <th>주문상품</th>
                            <td>
                                <div class="order-product">
                                    <span>왓츠인마이볼_상품명1</span>
                                    <span style="font-size: 10px; color: gray;">왓츠인마이볼_상품명1_옵션</span>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <hr style="margin-top: 40px;">
                </div>
    
                <!-- 결제 금액 정보 -->
                <div id="payment-info">
                    <span style="font-size: 18px; font-weight: 800;">결제 금액 정보</span>
                    <hr style="margin-top: 5px;">
    
                    <table>
                        <tr>
                            <th>주문일자</th>
                            <td>
                                <span>2021-12-24</span>
                            </td>
                        </tr>
                        <tr>
                            <th>주문자명</th>
                            <td>
                                <span>홍길동</span>
                            </td>
                        </tr>
                        <tr>
                            <th>결제예정금액</th>
                            <td>
                                <span class="price">35,000</span>
                            </td>
                        </tr>
                        <tr>
                            <th>할인금액</th>
                            <td>
                                <span>-3,000</span>
                            </td>
                        </tr>
                        <tr>
                            <th>결제금액</th>
                            <td>
                                <div id="end-price">
                                    <span id="price" style="font-size: 15px;">32,000</span>
                                    <span style="font-size: 10px;">적립 예정금 : 1600원</span>
                                </div>
                                
                            </td>
                        </tr>
                    </table>
                    <hr style="margin-top: 30px;">
                </div>
                <button id="check" class="btn btn-sm">확 인</button>
            </div>
        </div>
    </body>
    </html>