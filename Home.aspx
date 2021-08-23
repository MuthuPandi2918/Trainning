<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Seenu_Sport_Academy.Website.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- banner top begin -->
    <section class="banner-section abt_sec" style="position: relative">
        <div class="overlay" style="background-image: url(img/header-bg.jpg)">
            <div class="container">
                <div class="total-slide">
                    <img src="img/sld_lgo.png" class="av_sld_lgo">
                    <div class="row text-center">
                        <div class="col-lg-12">
                            <div class="banner-text">
                                <h1 class="font-light av_sld_cnt_h1">FEEL THE VICTORY</h1>
                                <h1 class="font-bold av_sld_cnt_h1" style="font-size: 40px !important">WITH US</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- banner top end -->
    <!-- about section begin -->
    <section class="about-section navigation av_abt_sec" id="about-section">
        <div class="container">
            <div class="row">
                <img src="img/about-bg.jpg" class="abt_lft_img">
                <div class="col-lg-4">
                    <div class="about-right">
                        <div class="video-box">
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="about-left">
                        <div class="about-text">
                            <h5 class="about-title">WELCOME TO OUR</h5>
                            <h2 class="about-subtitle">Seenu Sports Academy</h2>
                            <p class="about-description">
                                The Seenu sports academy kind physical education, professional sports & fitness development and training organization. We are looking to create awareness for sports and fitness as an important part of moral and physical education.<br>
                            </p>
                            <p class="about-description">
                                Since the last 7 years, over 2520 participants have undergone physical education training and sports coaching with The Seenu sports academy and it now operates in over 25 cities across the country.<br>
                            </p>
                            <p class="about-description" style="margin-bottom: 30px">
                                We provide physical education for schools in India, sports training, school sports management and total sports management services for schools and colleges to help them take their sports to the next level, and conduct Training Programs for all outdoor and indoor sports.
                            </p>
                            <div class="row about-box">
                                <div class="col-md-4">
                                    <div class="single-about-box">
                                        <div class="icon-box-outer bg-eff">
                                            <div class="icon-box">
                                                <i class="ren-people2"></i>
                                            </div>
                                        </div>
                                        <h3>Experianced<span class="av_abt_btm_txt">Trainers</span></h3>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="single-about-box">
                                        <div class="icon-box-outer bg-eff">
                                            <div class="icon-box">
                                                <i class="ren-deposit3"></i>
                                            </div>
                                        </div>
                                        <h3>Wide<span class="av_abt_btm_txt">Statium</span></h3>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="single-about-box">
                                        <div class="icon-box-outer bg-eff">
                                            <div class="icon-box">
                                                <i class="ren-efficiency"></i>
                                            </div>
                                        </div>
                                        <h3>Best<span class="av_abt_btm_txt">Coaching</span></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- about section end -->
    <!-- choose section begin -->
    <section class="choose-section">
        <div class="overlay">
            <div class="container-fruit text-center">
                <div class="row mr-0 ml-0 d-flex justify-content-center">
                    <div class="col-xl-8 col-lg-12">
                        <div class="choose-text">
                            <h5 class="choose-title">What we do</h5>
                            <h2 class="choose-subtitle">Our Coaching Sports</h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <a href="contact.aspx">
                            <div class="av_prdt_sec">
                                <img src="img/sprt-1.jpg" class="av_prdt_sec_img">
                                <div class="av_prdt_sec_cnt">Volleyball</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="contact.aspx">
                            <div class="av_prdt_sec">
                                <img src="img/sprt-2.jpg" class="av_prdt_sec_img">
                                <div class="av_prdt_sec_cnt">Cricket</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="contact.aspx">
                            <div class="av_prdt_sec">
                                <img src="img/sprt-3.jpg" class="av_prdt_sec_img">
                                <div class="av_prdt_sec_cnt">Badminton</div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- choose section end -->
</asp:Content>
