<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Seenu_Sport_Academy.Website.contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- header top end -->
    <div class="av_pg_ttl">
        Contact Us
        <div class="av_pg_ttl_a"><a href="Home.aspx">Home</a> / <span>Contact</span></div>
    </div>
    <section class="contact-us-section" id="contact-us-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-7" style="display: none">
                    <div class="contact-us-text">
                        <h5 class="contact-us-title">Where we are</h5>
                        <h2 class="contact-us-subtitle">Contact Us</h2>
                    </div>
                    <style>
                        .cnt_set {
                            display: block;
                            position: relative;
                            width: 100%;
                            overflow: hidden;
                            vertical-align: top;
                            margin-bottom: 10px;
                        }

                            .cnt_set .icon-box-outer {
                                width: 62px;
                                float: left;
                                display: inline-block
                            }

                            .cnt_set p {
                                display: inline-block;
                                float: left;
                                width: calc(100% - 63px);
                                padding-left: 15px;
                                padding-top: 15px !important;
                                line-height: 1.6;
                                font-size: 16px;
                                font-weight: 600;
                            }

                        .icon-box-outer.bg-eff {
                            border-color: #dcd5f7;
                        }

                        .icon-box-outer .icon-box {
                            color: #fff;
                            padding-top: 4px;
                            width: 50px;
                            height: 50px;
                            border-radius: 10px;
                            text-align: center;
                        }

                        .bg-eff .icon-box {
                            background-image: linear-gradient(90deg, #3b26db 1%, #7b19cb);
                            box-shadow: 0 0.313rem 0.313rem 0 rgba(59,38,219,.4);
                        }

                        .icon-box-outer .icon-box i {
                            font-size: 28px;
                            line-height: 48px;
                            background: none;
                        }

                        .icon-box-outer {
                            border: .063rem solid;
                            padding: 5px;
                            border-radius: 10px;
                            display: inline-block;
                            float: left;
                        }
                    </style>
                    <div class="cnt_set">
                        <div class="icon-box-outer bg-eff">
                            <div class="icon-box">
                                <i class="ren-ethereum1"></i>
                            </div>
                        </div>
                        <p style="padding-top: 0px !important;">
                            Tamilnadu,
                            <br>
                            India
                        </p>
                    </div>
                    <div class="cnt_set">
                        <div class="icon-box-outer bg-eff">
                            <div class="icon-box">
                                <i class="ren-compliant"></i>
                            </div>
                        </div>
                        <p>+91 90000 00000</p>
                    </div>
                    <div class="cnt_set">
                        <div class="icon-box-outer bg-eff">
                            <div class="icon-box">
                                <i class="ren-efficiency"></i>
                            </div>
                        </div>
                        <p>info@seenusportsacademy.com</p>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="contact-img">
                        <img src="img/contact-us.jpg" alt="#">
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="contact-form">
                        <form name="FeedBack" method="post" action="emailfeedback.asp" onsubmit="return submitcheck();" class="">
                            <h2 class="contact-head" style="font-weight: 600">Send Us a Message</h2>
                            <input type="text" name="firstname" placeholder="Name *" class="contact-frm active">
                            <input type="email" name="email" placeholder="Email *" class="contact-frm">
                            <input type="text" name="telephone" placeholder="Phone Number *" class="contact-frm">
                            <textarea name="comments" placeholder="Message *" class="contact-msg"></textarea>
                            <button name="Submit2" id="Submit" type="submit" class="contact-btn" onclick="return check();">Submit</button>
                            <br>
                            <br>
                            <br>
                            <input value="SC174T43" type="hidden" name="chkf" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
