<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<style>
    /* General Styles */
.hero-slider {
  position: relative;
  overflow: hidden;
  width: 100%;
  height: 100vh;
}

.hero-inner {
  position: absolute;
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: transform 1s ease-in-out;
  background-color: #000; /* Fallback if background image is missing */
}

.hero-bg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-size: cover;
  background-position: center;
  z-index: -1; /* Makes sure the background is behind text */
}

.overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.4);
  z-index: 0;
}

.hero-content {
  color: white;
  z-index: 1;
  text-align: center;
}

.hero-title {
  font-size: 3em;
  font-weight: bold;
  margin: 20px 0;
}

.hero-subtitle {
  font-size: 1.5em;
  margin-bottom: 15px;
}

.hero-text {
  font-size: 1.2em;
  margin-bottom: 20px;
}



/* For slide navigation */
.hero-slider .prev, .hero-slider .next {
  position: absolute;
  top: 50%;
  z-index: 10;
  font-size: 2em;
  color: white;
  background-color: rgba(0, 0, 0, 0.5);
  border: none;
  padding: 10px;
  cursor: pointer;
}

.hero-slider .prev {
  left: 10px;
  transform: translateY(-50%);
}

.hero-slider .next {
  right: 10px;
  transform: translateY(-50%);
}


</style>


 <section>

  <div class="hero-slider">
  <div class="hero-inner style2">
    <div class="overlay"></div>
    <div class="hero-bg" style="background-image:url('assets/img/bg/slider-bg1.jpg')"></div>
    <div class="container">
      <div class="row justify-content-between">
        <div class="col-lg-7 mx-auto">
          <div class="hero-content style2 text-center">
            <span class="hero-subtitle" style="color:black;">Get Best event Management</span>
            <h1 class="hero-title" style="color:black">Hall</h1>
            <p class="hero-text" style="color:black; font-weight:900">An Enchanting Evening of Love and Celebration.</p>
            <div class="hero-btns justify-content-center">
              <a href="#/Hall" class="vs-btn">Add</a>
              <a href="#/Hall" class="vs-btn style3">View</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="hero-inner style2">
    <div class="overlay"></div>
    <div class="hero-bg" style="background-image:url('assets/img/bg/slider-bg3.jpg')"></div>
    <div class="container">
      <div class="row justify-content-between">
        <div class="col-lg-7 mx-auto">
          <div class="hero-content style2 text-center">
            <span class="hero-subtitle">Experience Next-Gen Events</span>
            <h1 class="hero-title">Caters</h1>
            <p class="hero-text">Savor the Flavor: Unforgettable Catering for Every Event!</p>
            <div class="hero-btns justify-content-center">
              <a href="#/Cater" class="vs-btn">Add</a>
              <a href="#/Cater" class="vs-btn style3">View</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

<div class="hero-inner style2">
    <div class="overlay"></div>
    <div class="hero-bg" style="background-image:url('assets/img/bg/slider-bg4.jpg')"></div>
    <div class="container">
      <div class="row justify-content-between">
        <div class="col-lg-7 mx-auto">
          <div class="hero-content style2 text-center">
            <span class="hero-subtitle">Experience Next-Gen Events</span>
            <h1 class="hero-title">Photography</h1>
            <p class="hero-text">Capturing Event Moments, Creating Lasting Memories.</p>
            <div class="hero-btns justify-content-center">
              <a href="#/Photography" class="vs-btn">Add</a>
              <a href="#/Photography" class="vs-btn style3">View</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

      <div class="hero-inner style2">
    <div class="overlay"></div>
    <div class="hero-bg" style="background-image:url('assets/img/bg/slider-bg2.jpg')"></div>
    <div class="container">
      <div class="row justify-content-between">
        <div class="col-lg-7 mx-auto">
          <div class="hero-content style2 text-center">
            <span class="hero-subtitle">Experience Next-Gen Events</span>
            <h1 class="hero-title">Decorators</h1>
            <p class="hero-text">Transforming Spaces, Creating Memories.</p>
            <div class="hero-btns justify-content-center">
              <a href="#/Decorator" class="vs-btn">Add</a>
              <a href="#/Decorator" class="vs-btn style3">View</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Add more slides as needed -->
</div>



  
  </section>
  
  <!-- Hero End Area -->
  <!-- About Area Start -->
  <section class="about space-top space-extra-bottom" id="about">
    <div class="container">
      <div class="row gx-40 align-items-center">
        <div class="col-lg-6">
          <div class="img-box3 text-center">
            <div class="card-style2">
              <span class="number">NOOR</span>
              <h3 class="title">EVENTS</h3>
            </div>
            <div class="img1">
              <img src="assets/img/about/a-3-1.jpg" alt="About Image">
            </div>
            <div class="img2">
              <img src="assets/img/about/a-3-2.jpg" alt="About Image">
            </div>
          </div>
        </div>
        <div class="col-lg-6 mb-30">
          <span class="sec-subtitle">About Us</span>
          <h2 class="sec-title">Your Trusted Event Management Partner</h2>
          <p>At Noor Events, we are passionate about making your special moments truly unforgettable. Whether it's a grand wedding, 
              a corporate gathering, or an intimate celebration, we provide comprehensive event management services that bring your
               vision to life.</p>
          <div class="list-style1 style2">
            <ul>
              <li><i class="fal fa-check-circle"></i> Transforming your venue into a stunning reflection of your vision and style.</li>
              <li><i class="fal fa-check-circle"></i>  Serving exquisite, personalized menus that leave a lasting impression on your guests.</li>
              <li><i class="fal fa-check-circle"></i> Capturing every special moment with artistry and precision.</li>
              <li><i class="fal fa-check-circle"></i> Seamlessly coordinating every detail to ensure your event is flawless and memorable.</li>
            </ul>
          </div>
          <div class="d-inline-flex">
            <a href="#/home" class="vs-btn" tabindex="0">
              More Information
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- About Area End -->
  <!-- Feature Area -->
  <section class="feature-layout2">
    <div class="container">
      <div class="row vs-carousel" data-slide-show="4" data-lg-slide-show="3" data-md-slide-show="2" data-md-slide-show="2">
        <div class="col-lg-3 col-md-6">
          <div class="feature-style2">
            <div class="feature-icon">
              <img src="assets/img/icons/f-1-1.svg" alt="feature icon 1">
            </div>
            <h3 class="feature-title h5">Friendly Team</h3>
            <p class="feature-text">Our friendly, dedicated team is here to guide you every step of the way, ensuring your event is stress-free and enjoyable. With personalized care, we make your vision come to life!</p>
          </div>
        </div>
        <div class="col-lg-3 col-md-6">
          <div class="feature-style2">
            <div class="feature-icon">
              <img src="assets/img/icons/f-1-2.svg" alt="feature icon 1">
            </div>
            <h3 class="feature-title h5">Brilliant Idea</h3>
            <p class="feature-text">"Bringing brilliant ideas to life with creativity and precision, ensuring your event stands out. We turn your vision into a stunning reality, 
                making every moment unforgettable!.</p>
          </div>
        </div>
        <div class="col-lg-3 col-md-6">
          <div class="feature-style2">
            <div class="feature-icon">
              <img src="assets/img/icons/f-1-3.svg" alt="feature icon 1">
            </div>
            <h3 class="feature-title h5">Perfect Work</h3>
            <p class="feature-text">Delivering perfect work with meticulous attention to detail, ensuring every aspect of your event exceeds expectations. We take pride in crafting flawless experiences 
                from start to finish!.</p>
          </div>
        </div>
        <div class="col-lg-3 col-md-6">
          <div class="feature-style2">
            <div class="feature-icon">
              <img src="assets/img/icons/f-1-4.svg" alt="feature icon 1">
            </div>
            <h3 class="feature-title h5">Support 24/7</h3>
            <p class="feature-text">Providing 24/7 support to ensure your event runs smoothly, offering assistance and solutions whenever you need them, day or night. We're always here to assist, no matter the time or need!</p>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- Feature Area End -->
  <!-- Upcoming Events -->
  <section class="events-layout2" id="services">
    <div class="container">
      <div class="row">
        <div class="col-xxl-6 col-xl-7 col-lg-8 col-md-10 mx-auto">
          <div class="title-area text-center">
            <span class="sec-subtitle2">Upcoming Events</span>
            <h2 class="sec-title">View Our Next Upcoming Awesome Events</h2>
          </div>
        </div>
      </div>
      <div class="row vs-carousel events-slide2 wow fadeInUp" data-slide-show="1" data-center-mode="true" data-xl-center-mode="true" data-ml-center-mode="true" data-lg-center-mode="true" data-md-center-mode="true" data-center-padding="370px" data-xl-center-padding="370px" data-ml-center-padding="300px" data-lg-center-padding="200px" data-md-center-padding="80px">
        <div class="col-md-6 col-lg-4">
          <div class="event-style2">
            <div class="event-img">
              <div class="overlay"></div>
              <img class="img" src="assets/img/events/wedding.jpg" alt="e 1 1">
              <div class="event-date">
                <span>20</span>
                January
              </div>
              <h3 class="event-title" style="color:white">Wedding Events</h3>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4">
          <div class="event-style2">
            <div class="event-img">
              <div class="overlay"></div>
              <img class="img" src="assets/img/events/birthday.jpg" alt="e 1 1">
              <div class="event-date">
                <span>20</span>
                January
              </div>
              <h3 class="event-title" style="color:white">Birthday Event</h3>
            </div>
        
          </div>
        </div>
        <div class="col-md-6 col-lg-4">
          <div class="event-style2">
            <div class="event-img">
              <div class="overlay"></div>
              <img class="img" src="assets/img/services/s-1-1.jpg" alt="e 1 1">
              <div class="event-date">
                <span>20</span>
                January
              </div>
              <h3 class="event-title" style="color:white">Reunion Party</h3>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4">
          <div class="event-style2">
            <div class="event-img">
              <div class="overlay"></div>
              <img class="img" src="assets/img/events/newYear.jpg" alt="e 1 1">
              <div class="event-date">
                <span>20</span>
                January
              </div>
              <h3 class="event-title" style="color:white">Happy New Year Reunion Festivals</h3>
            </div>
         
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- Upcoming Events End -->
  
  <!-- Service Area -->
  <section class="service-layout2">
    <div class="container">
      <div class="row justify-content-between align-items-end">
        <div class="col-lg-6">
          <div class="title-area">
            <span class="sec-subtitle">Services</span>
            <h2 class="sec-title">Get A New Experience With Eventino Services</h2>
          </div>
        </div>
      </div>
      <div class="row vs-carousel" data-slide-show="4" data-lg-slide-show="3" data-md-slide-show="2" id="service-slider1">
        <div class="col-lg-3">
          <div class="service-style2" data-bg-src="assets/img/events/decoration.jpg">
            <div class="overlay"></div>
            <div class="service-img">
              <img  src="assets/img/events/decoration.jpg" alt="service image"><img src="" />
            </div>
            <div class="service-content">
              <h3 class="service-name h5">Decoration</h3>
            </div>
            <a href="#/Decorator" class="vs-btn">Read More<i class="fas fa-arrow-right"></i></a>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="service-style2" data-bg-src="assets/img/services/s-big-1-2.jpg">
            <div class="overlay"></div>
            <div class="service-img">
              <img src="assets/img/events/photography.jpg" alt="service image">
            </div>
            <div class="service-content">
              <h3 class="service-name h5">Photography</h3>
            </div>
            <a href="#/Photography" class="vs-btn">Read More<i class="fas fa-arrow-right"></i></a>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="service-style2" data-bg-src="assets/img/services/s-big-1-3.jpg">
            <div class="overlay"></div>
            <div class="service-img">
              <img src="assets/img/events/hall.jpg"  alt="service image">
            </div>
            <div class="service-content">
              <h3 class="service-name h5">Hall</h3>
            </div>
            <a href="#/hall" class="vs-btn">Read More<i class="fas fa-arrow-right"></i></a>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="service-style2" data-bg-src="assets/img/services/s-big-1-4.jpg">
            <div class="overlay"></div>
            <div class="service-img" style="border-radius: 50% !important;">
              <img src="assets/img/events/caters.jpg" alt="service image">
            </div>
            <div class="service-content">
              <h3 class="service-name h5">Catering</h3>
            </div>
            <a href="#/Cater" class="vs-btn">Read More<i class="fas fa-arrow-right"></i></a>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- Service Area End -->
  <!-- Counter Area Start -->
  <div class="position-relative">
    <div class="counter-wrap2">
      <div class="overlay"></div>
      <img class="shape-1" src="assets/img/shapes/c-1-1.png" alt="shape1">
      <img class="shape-2" src="assets/img/shapes/c-1-2.png" alt="shape2">
      <div class="container wow fadeInUp" data-wow-delay="0.2s">
        <div class="row g-4 justify-content-between">
          <div class="col-6 col-lg-auto">
            <div class="counter-media count-start">
              <div class="counter-media__icon"><img src="assets/img/icons/c-1-1.svg" alt="icon"></div>
              <div class="media-body">
                <span class="counter-media__number"><span class="counters" data-counter="858">858</span>+</span>
                <p class="counter-media__title">Successful Projects</p>
              </div>
            </div>
          </div>
          <div class="col-6 col-lg-auto">
            <div class="counter-media count-start">
              <div class="counter-media__icon"><img src="assets/img/icons/c-1-2.svg" alt="icon"></div>
              <div class="media-body">
                <span class="counter-media__number"><span class="counters" data-counter="567">567</span>+</span>
                <p class="counter-media__title">Media Activities</p>
              </div>
            </div>
          </div>
          <div class="col-6 col-lg-auto">
            <div class="counter-media count-start">
              <div class="counter-media__icon"><img src="assets/img/icons/c-1-3.svg" alt="icon"></div>
              <div class="media-body">
                <span class="counter-media__number"><span class="counters" data-counter="15">15</span>+</span>
                <p class="counter-media__title">Skilled Experts</p>
              </div>
            </div>
          </div>
          <div class="col-6 col-lg-auto">
            <div class="counter-media count-start">
              <div class="counter-media__icon"><img src="assets/img/icons/c-1-4.svg" alt="icon"></div>
              <div class="media-body">
                <span class="counter-media__number"><span class="counters" data-counter="30">30</span>+</span>
                <p class="counter-media__title">Happy Clients</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
                
                    
  <!-- Team Area end -->
  <!-- Gallery Area Start -->
  <%--<section class="smoke-bg space-top space-extra-bottom overflow-hidden">
    <div class="container">
      <div class="row align-items-end justify-content-between">
        <div class="col-lg-5">
          <div class="title-area">
            <span class="sec-subtitle">Eventino Gallery</span>
            <h2 class="sec-title">Our Amazing And unforgettable Times</h2>
          </div>
        </div>
        <div class="col-auto">
          <div class="d-inline-flex pt-10 title-area">
            <a href="event.html" class="vs-btn">View All Events</a>
          </div>
        </div>
      </div>
      <div class="row gx-30 filter-active filter-gallery">
        <div class="col-lg-3 col-md-6 filter-item">
          <div class="gallery-style1">
            <a href="assets/img/gallery/g-1-1.jpg" class="popup-image popup-link">
              <i class="fas fa-image"></i>
            </a>
            <div class="overlay"></div>
            <div class="gallery-thumb">
              <img src="assets/img/gallery/g-1-1.jpg" alt="gallery">
            </div>
            <div class="gallery-content">
              <div class="gallery-date">
                <span>
                <i class="fas fa-clock"></i>
                08:00am - 22:00pm
              </span>
              </div>
              <h3 class="gallery-title h5">
                <a href="gallery-details.html">Business Conference In Australia</a>
              </h3>
            </div>
          </div>
        </div>
        <div class="col-lg-6 col-md-6 filter-item grid-item--width2">
          <div class="gallery-style1">
            <a href="https://www.youtube.com/watch?v=_sI_Ps7JSEk" class="popup-video popup-link">
              <i class="fas fa-play"></i>
            </a>
            <div class="overlay"></div>
            <div class="gallery-thumb">
              <img src="assets/img/gallery/g-1-2.jpg" alt="gallery">
            </div>
            <div class="gallery-content">
              <div class="gallery-date">
                <span>
                <i class="fas fa-clock"></i>
                08:00am - 22:00pm
              </span>
              </div>
              <h3 class="gallery-title h5">
                <a href="gallery-details.html">Empowering Business Growth Conference in Melbourne</a>
              </h3>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 filter-item">
          <div class="gallery-style1">
            <a href="assets/img/gallery/g-1-3.jpg" class="popup-image popup-link">
              <i class="fas fa-image"></i>
            </a>
            <div class="overlay"></div>
            <div class="gallery-thumb">
              <img src="assets/img/gallery/g-1-3.jpg" alt="gallery">
            </div>
            <div class="gallery-content">
              <div class="gallery-date">
                <span>
                <i class="fas fa-clock"></i>
                08:00am - 22:00pm
              </span>
              </div>
              <h3 class="gallery-title h5">
                <a href="gallery-details.html">Melbourne Business Mastermind</a>
              </h3>
            </div>
          </div>
        </div>
        <div class="col-lg-6 col-md-6 filter-item grid-item--width2">
          <div class="gallery-style1">
            <a href="https://www.youtube.com/watch?v=_sI_Ps7JSEk" class="popup-video popup-link">
              <i class="fas fa-play"></i>
            </a>
            <div class="overlay"></div>
            <div class="gallery-thumb">
              <img src="assets/img/gallery/g-1-4.jpg" alt="gallery">
            </div>
            <div class="gallery-content">
              <div class="gallery-date">
                <span>
                <i class="fas fa-clock"></i>
                08:00am - 22:00pm
              </span>
              </div>
              <h3 class="gallery-title h5">
                <a href="gallery-details.html">Innovative Leadership Summit for Australian Entrepreneurs</a>
              </h3>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 filter-item">
          <div class="gallery-style1">
            <a href="assets/img/gallery/g-1-5.jpg" class="popup-image popup-link">
              <i class="fas fa-image"></i>
            </a>
            <div class="overlay"></div>
            <div class="gallery-thumb">
              <img src="assets/img/gallery/g-1-5.jpg" alt="gallery">
            </div>
            <div class="gallery-content">
              <div class="gallery-date">
                <span>
                <i class="fas fa-clock"></i>
                08:00am - 22:00pm
              </span>
              </div>
              <h3 class="gallery-title h5">
                <a href="gallery-details.html">Canberra Commerce Convention</a>
              </h3>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 filter-item">
          <div class="gallery-style1">
            <a href="assets/img/gallery/g-1-6.jpg" class="popup-image popup-link">
              <i class="fas fa-image"></i>
            </a>
            <div class="overlay"></div>
            <div class="gallery-thumb">
              <img src="assets/img/gallery/g-1-6.jpg" alt="gallery">
            </div>
            <div class="gallery-content">
              <div class="gallery-date">
                <span>
                <i class="fas fa-clock"></i>
                08:00am - 22:00pm
              </span>
              </div>
              <h3 class="gallery-title h5">
                <a href="gallery-details.html">Sydney Leadership Symposium</a>
              </h3>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 filter-item">
          <div class="gallery-style1">
            <a href="assets/img/gallery/g-1-7.jpg" class="popup-image popup-link">
              <i class="fas fa-image"></i>
            </a>
            <div class="overlay"></div>
            <div class="gallery-thumb">
              <img src="assets/img/gallery/g-1-7.jpg" alt="gallery">
            </div>
            <div class="gallery-content">
              <div class="gallery-date">
                <span>
                <i class="fas fa-clock"></i>
                08:00am - 22:00pm
              </span>
              </div>
              <h3 class="gallery-title h5">
                <a href="gallery-details.html">Brisbane Business Breakthrough</a>
              </h3>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 filter-item">
          <div class="gallery-style1">
            <a href="assets/img/gallery/g-1-8.jpg" class="popup-image popup-link">
              <i class="fas fa-image"></i>
            </a>
            <div class="overlay"></div>
            <div class="gallery-thumb">
              <img src="assets/img/gallery/g-1-8.jpg" alt="gallery">
            </div>
            <div class="gallery-content">
              <div class="gallery-date">
                <span>
                <i class="fas fa-clock"></i>
                08:00am - 22:00pm
              </span>
              </div>
              <h3 class="gallery-title h5">
                <a href="gallery-details.html">Canberra Commerce Convention</a>
              </h3>
            </div>
          </div>
        </div>
        <div class="col-lg-6 col-md-6 filter-item grid-item--width2">
          <div class="gallery-style1">
            <a href="https://www.youtube.com/watch?v=_sI_Ps7JSEk" class="popup-video popup-link">
              <i class="fas fa-play"></i>
            </a>
            <div class="overlay"></div>
            <div class="gallery-thumb">
              <img src="assets/img/gallery/g-1-9.jpg" alt="gallery">
            </div>
            <div class="gallery-content">
              <div class="gallery-date">
                <span>
                <i class="fas fa-clock"></i>
                08:00am - 22:00pm
              </span>
              </div>
              <h3 class="gallery-title h5">
                <a href="gallery-details.html">Transformative Business Strategies Conference in Australia</a>
              </h3>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>--%>
  <!-- Gallery Area End -->
  <!-- Blog Area -->
  <%--<section class="space-top space-extra-bottom">
    <div class="container">
      <div class="row justify-content-between align-items-end">
        <div class="col-lg-6">
          <div class="title-area">
            <span class="sec-subtitle2">Blog And News</span>
            <h2 class="sec-title">Our Latest Blog And Latest News</h2>
          </div>
        </div>
        <div class="col-auto">
          <div class="blog-slide-btns title-area">
            <button class="vs-btn" data-slick-prev="#blog-slider1">
              <i class="far fa-arrow-left"></i>
            </button>
            <button class="vs-btn" data-slick-next="#blog-slider1">
              <i class="far fa-arrow-right"></i>
            </button>
          </div>
        </div>
      </div>
      <div class="row vs-carousel" data-slide-show="3" data-md-slide-show="2" id="blog-slider1">
        <div class="col-lg-4">
          <div class="vs-blog blog-style2">
            <div class="blog-img">
              <a href="blog-details.html">
                <img class="blog-img__item" src="assets/img/blog/blog-8-1.jpg" alt="blog">
                <img class="blog-img__item" src="assets/img/blog/blog-8-1.jpg" alt="blog">
              </a>
              <span class="blog-date"><i class="fas fa-clock"></i>January 25, 2024</span>
            </div>
            <div class="blog-content">
              <div class="blog-metas">
                <ul>
                  <li>
                    <a class="blog-meta" href="blog-details.html">
                      <i class="fas fa-user"></i> By Admin
                    </a>
                  </li>
                  <li>
                    <a class="blog-meta" href="blog-details.html">
                      <i class="fas fa-comments"></i> (03) Comments
                    </a>
                  </li>
                </ul>
              </div>
              <h3 class="blog-title h5"><a href="blog-details.html">Global Business Goal Make
                  Life Easy From Tech</a></h3>
              <a class="blog-link" href="blog-details.html">Read More<i class="far fa-arrow-right"></i></a>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="vs-blog blog-style2">
            <div class="blog-img">
              <a href="blog-details.html">
                <img class="blog-img__item" src="assets/img/blog/blog-8-2.jpg" alt="blog">
                <img class="blog-img__item" src="assets/img/blog/blog-8-2.jpg" alt="blog">
              </a>
              <span class="blog-date"><i class="fas fa-clock"></i>January 25, 2024</span>
            </div>
            <div class="blog-content">
              <div class="blog-metas">
                <ul>
                  <li>
                    <a class="blog-meta" href="blog-details.html">
                      <i class="fas fa-user"></i> By Admin
                    </a>
                  </li>
                  <li>
                    <a class="blog-meta" href="blog-details.html">
                      <i class="fas fa-comments"></i> (03) Comments
                    </a>
                  </li>
                </ul>
              </div>
              <h3 class="blog-title h5"><a href="blog-details.html">Advantage Enhancing Global Business
                  Efficiency</a></h3>
              <a class="blog-link" href="blog-details.html">Read More<i class="far fa-arrow-right"></i></a>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="vs-blog blog-style2">
            <div class="blog-img">
              <a href="blog-details.html">
                <img class="blog-img__item" src="assets/img/blog/blog-8-3.jpg" alt="blog">
                <img class="blog-img__item" src="assets/img/blog/blog-8-3.jpg" alt="blog">
              </a>
              <span class="blog-date"><i class="fas fa-clock"></i>January 25, 2024</span>
            </div>
            <div class="blog-content">
              <div class="blog-metas">
                <ul>
                  <li>
                    <a class="blog-meta" href="blog-details.html">
                      <i class="fas fa-user"></i> By Admin
                    </a>
                  </li>
                  <li>
                    <a class="blog-meta" href="blog-details.html">
                      <i class="fas fa-comments"></i> (03) Comments
                    </a>
                  </li>
                </ul>
              </div>
              <h3 class="blog-title h5"><a href="blog-details.html">Leveraging Technology for Global Business Ease</a>
              </h3>
              <a class="blog-link" href="blog-details.html">Read More<i class="far fa-arrow-right"></i></a>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="vs-blog blog-style2">
            <div class="blog-img">
              <a href="blog-details.html">
                <img class="blog-img__item" src="assets/img/blog/blog-8-4.jpg" alt="blog">
                <img class="blog-img__item" src="assets/img/blog/blog-8-4.jpg" alt="blog">
              </a>
              <span class="blog-date"><i class="fas fa-clock"></i>January 25, 2024</span>
            </div>
            <div class="blog-content">
              <div class="blog-metas">
                <ul>
                  <li>
                    <a class="blog-meta" href="blog-details.html">
                      <i class="fas fa-user"></i> By Admin
                    </a>
                  </li>
                  <li>
                    <a class="blog-meta" href="blog-details.html">
                      <i class="fas fa-comments"></i> (03) Comments
                    </a>
                  </li>
                </ul>
              </div>
              <h3 class="blog-title h5"><a href="blog-details.html">Leveraging Technology for Global Business Ease</a>
              </h3>
              <a class="blog-link" href="blog-details.html">Read More<i class="far fa-arrow-right"></i></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>--%>


<script>
    let currentSlide = 0;
    const slides = document.querySelectorAll('.hero-inner');
    const totalSlides = slides.length;

    function showSlide(index) {
        // Hide all slides
        slides.forEach((slide, i) => {
            slide.style.transform = `translateX(${(i - index) * 100}%)`;
        });
    }

    function nextSlide() {
        currentSlide = (currentSlide + 1) % totalSlides;
        showSlide(currentSlide);
    }

    function prevSlide() {
        currentSlide = (currentSlide - 1 + totalSlides) % totalSlides;
        showSlide(currentSlide);
    }

    // Automatically move to the next slide every 5 seconds
    setInterval(nextSlide, 5000);

    // Initially display the first slide
    showSlide(currentSlide);

    // Optional: Add controls to manually switch slides
    document.querySelector('.prev').addEventListener('click', prevSlide);
    document.querySelector('.next').addEventListener('click', nextSlide);

</script>