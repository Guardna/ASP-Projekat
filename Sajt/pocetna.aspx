<%@ Page Title="Pocetna" MetaDescription="Pocetna strana" MetaKeywords="Restoran" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="pocetna.aspx.cs" Inherits="Sajt.pocetna" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
          <div class="item active">
            <img src="img/slider1.jpg" alt="Image1"/>
            <div class="carousel-caption">
              <h3>Food with thought</h3>
              <p>You must try</p>
            </div>      
          </div>

          <div class="item">
            <img src="img/slider2.jpg" alt="Image2"/>
            <div class="carousel-caption">
              <h3>We love to see you smile</h3>
              <p>And make you come again</p>
            </div>      
          </div>
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
    </div>
  
    <div class="container text-center">    
      <h3>Our Menu</h3><br/>
      <div class="row">
        <div class="col-sm-4">
          <img src="img/food1.jpg" class="img-responsive" style="width:100%" alt="Food1"/>
          <h4>Delicious</h4>
        </div>
        <div class="col-sm-4"> 
          <img src="img/food2.jpg" class="img-responsive" style="width:100%" alt="Food2"/>
          <h4>Tasty</h4>    
        </div>
        <div class="col-sm-4"> 
          <img src="img/drinks1.jpeg" class="img-responsive" style="width:100%" alt="Drinks1"/>
          <h4>Refreshing</h4>    
        </div>
      </div>
    </div><br/>
</asp:Content>