import React from "react";
import "./Portfolio.css";
import { FaInstagram, FaLinkedin, FaFacebook, FaGithub } from 'react-icons/fa';

const Portfolio = () => {
  return (
    <div className="portfolio-container">
      <div className="container1">
        <div className="text">
          Zain Malik Portfolio
        </div>
      </div>

      <div className="profile-box">
        <div className="profile-title">
          Front-end and Back-end Developer
        </div>
        <div className="profile-content">
          <div className="profile-description">
          <p>Hello! I'm a passionate developer with a focus on creating dynamic and responsive web applications. <br></br>I thrive on solving complex problems and continuously improving my skills to stay ahead in the ever-evolving tech landscape.</p>
          </div>
          <div className="profile-picture">
            <img src=" C:\Users\A.C\OneDrive\Desktop\New Website\website\src\Photo\WhatsApp Image 2024-05-18 at 16.50.23_648573f9.jpg"/>
          </div>
        </div>
      </div>
      <div className="box2">
  <ul className="box2-title">
    <li>2 Months Experience</li>
    <li>3 Front-end Projects</li>
    <li>2 Back-end Projects</li>
    <li>12 Certificates</li>
  </ul>
</div>
 
                 
               
       
        
        <div className="box3">About Myself
        </div>

        <div className="box-container">
        <div className="box4">
        Web Developer
        </div>
          <div className="box-title">
          Developed a website called Tutor Tribe it is an online platform<br></br> for teachers and students to schedule virtual sessions anytime,anywhere.<br></br> It makes arranging home tutoring easier for both parties.
        </div>

        <div className="box5">
       My Learnings
        </div>
        <div className="box5-title">
        I've done several online courses in this field from websites like Coursera and
        FutureLearn.<br></br> These courses have given me a lot of valuable<br></br> experience in order to learn more effeciently and easily.

        </div>
        
        <div className="expertise-container">
          <div className="box6">
          My Expertise
          </div>
  <div className="expertise-item">
    <div className="expertise-circle">HTML</div>
    <div className="expertise-percentage">90%</div>
  </div>
  <div className="expertise-item">
    <div className="expertise-circle">CSS</div>
    <div className="expertise-percentage">90%</div>
  </div>
  <div className="expertise-item">
    <div className="expertise-circle">Java</div>
    <div className="expertise-percentage">60%</div>
  </div>
  <div className="expertise-item">
    <div className="expertise-circle">Python</div>
    <div className="expertise-percentage">80%</div>
  </div>
  <div className="expertise-item">
    <div className="expertise-circle">C/C++/C#</div>
    <div className="expertise-percentage">50%</div>
  </div>
</div>

<div className="box7">
  My Projects
</div>

<div className="box7-pic1">
  <img src="https://images.pexels.com/photos/1181271/pexels-photo-1181271.jpeg?auto=compress&cs=tinysrgb&w=600"></img>
</div>
        
         </div>

         <div className="box8">
          My Personal Links
         </div>

         <div className="box8-links">
      <div className="icon-container1">
        <a href="https://www.instagram.com/zain_malik242/" target="_blank" rel="noopener noreferrer">
          <FaInstagram size={100} />
          
        </a>
        
      </div>
      <div className="icon-container2">
        <a href="https://www.linkedin.com/in/zain-malik-433751280" target="_blank" rel="noopener noreferrer">
          <FaLinkedin size={100} /> 
        </a>
       
      </div>
      <div className="icon-container3">
        <a href="https://www.facebook.com/profile.php?id=100059557196132" target="_blank" rel="noopener noreferrer">
          <FaFacebook size={100} /> 
        </a>
        
      </div>
      <div className="icon-container4">
    <a href="https://github.com/Zainmalik242/Zainmalik242" target="_blank" rel="noopener noreferrer">
      <FaGithub size={100} />
    </a>
    </div>
      </div>
   </div>
  );
};

export default Portfolio;
