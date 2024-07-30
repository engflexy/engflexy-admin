<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body style="background-color: #263238;border-radius: 5px; direction: ltr">

<div class="container">
    <div class="row">

        <div style="
            color: white;
            text-align: center;
            padding-top: 30px;
            justify-content: center!important;
           margin-left: 45%!important;
            display: flex;" class="col-12">
            <img style="width: 90px;display:block" class="logo-white"
                 src="https://engflexy.com/images/logo/Engflexy-white-500.png" alt="ENGFLEXY"
                 title="ENGFLEXY" width="90" height="90"/>

        </div>

        <div style="padding: 20px 10px;
         font-family: verdana;
            font-size: 20px;
            color: white;
            font-weight: bold;" class="col-md-12 title">
            Hi ${username},
        </div>

        <div style="padding: 20px 10px;color: white;" class="col-md-12 description">
            Just a reminder
            to let you
            know that your lesson with ${teacher} will start on ${lessonDate}. There is more detailed information on the
            lesson below
        </div>

        <div style="padding: 20px 10px;color: white;
        font-family: 'Helvetica Neue', Arial, Tahoma, Geneva, sans-serif;
            color: #adb5bd;
            font-size: 16px;
            line-height: 22px;
            font-weight: bold" class="col-md-12 detail">
            <ul>
                <li>Lesson Date/Time: ${lessonDate}</li>
            </ul>
        </div>
        <div style="padding: 20px 10px;text-align: center !important;justify-content: center!important;align-items: center!important;"
             class="col-md-12 button__container">
            <a style="
            width: 200px;
            font-weight: bold!important;
            color: white!important;
            background: #ff725e!important;
            height: 50px;
            text-align: center;
            display: inline-grid;
            border-radius: 5px;
            font-size: 18px;
            text-decoration: none;
            align-items: center;
            " href="https://app.engflexy.com/student/courses" type="button"
               class="btn btn-dark">Open class</a>
        </div>

    </div>
</div>
<footer style="
direction: ltr;
background-color: #f8f9fa!important;
padding-top: 1rem!important;
align-items: center!important;
padding-bottom: 1rem!important;
justify-content: space-between!important;
margin-top: 1.5rem!important;
box-shadow: 0 1rem 3rem rgba(0,0,0,.175)!important;
    margin-bottom: 1.5rem!important;
    border-top: 1px solid #dee2e6!important;
        flex-wrap: wrap!important;
padding: 10px;"
>
    <div style="display: flex!important;">
        <div style="
    align-items: center!important;
    display: flex!important;
    ">
            <a
                    style="text-decoration: none!important;
        line-height: 1!important;
        margin-bottom: 1rem!important;
        margin-right: 0.5rem!important;
        color: #ff725e;
        "
                    href="/">
                <svg class="bi" width="30" height="24">
                    <use xlink:href="#bootstrap"></use>
                </svg>
            </a>
            <span style="margin-bottom: 1rem!important;

        ">EngFlexy©2024</span>
        </div>


        <ul style="
    color: #fff!important;
    justify-content: flex-end!important;
        display: flex!important;
        flex-wrap: wrap;
    padding-left: 0;
    margin-bottom: 0;
    margin-top: 0;
    list-style: none;
    ">
            <li style="margin-left: 1rem!important;color: #fff!important;list-style: none;">
                <a class="text-white" href="https://www.facebook.com/engflexy" target="_blank">
                    <img src="https://img.icons8.com/ios-glyphs/30/000000/facebook-new.png" alt="facebook"/>
                </a>
            </li>

            <li style="margin-left: 1rem!important;color: #fff!important;list-style: none;">
                <a class="text-body-secondary" href="https://www.instagram.com/engflexy/" target="_blank">
                    <img src="https://img.icons8.com/ios-glyphs/30/000000/instagram-new.png" alt="instagram"/>
                </a>
            </li>

            <li style="margin-left: 1rem!important;color: #fff!important;list-style: none;">
                <a class="text-body-secondary" href="https://www.tiktok.com/@engflexy" target="_blank">
                    <img src="https://img.icons8.com/ios-glyphs/30/000000/tiktok.png" alt="tiktok"/>
                </a>
            </li>
        </ul>
    </div>


    <div style="padding: 20px;
    border-top: 1px solid #263238;
    width: 100%;
    margin-top: 30px;">
        <div
                style="--bs-gutter-x: 1.5rem;
        --bs-gutter-y: 0;
        display: flex;
        flex-wrap: wrap;
        margin-top: calc(var(--bs-gutter-y) * -1);
        margin-right: calc(var(--bs-gutter-x) * -.5);
        margin-left: calc(var(--bs-gutter-x) * -.5);">
            <div style="
              text-align: center!important;align-items: center!important;
              display: flex!important;
              width:100%;
            ">
                <p>
                    You received this email because you are a registered member on
                    <a style="color:#ff725e!important" href="https://engflexy.com" target="_blank">ENGFLEXY</a>
                    . If you would like to
                    change
                    your
                    email notification preferences, please
                    <a style="color:#ff725e!important" href="https://engflexy.com/unsubscribe" target="_blank"> click
                        here</a>.
                    Replies to this email address will not be read.
                </p>
            </div>
        </div>
    </div>
</footer>
</body>
</html>
