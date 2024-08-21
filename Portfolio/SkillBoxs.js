import React, { useState } from 'react';
import { useInView } from 'react-intersection-observer';
import './SkillsBox.css';

const Skill = ({ skill, percentage }) => {
  const [count, setCount] = useState(0);
  const { ref, inView } = useInView({
    triggerOnce: true,
    onChange: (inView) => {
      if (inView) {
        let start = 0;
        const interval = setInterval(() => {
          start += 1;
          setCount(start);
          if (start === percentage) clearInterval(interval);
        }, 20); // Adjust this value to change the speed of counting
      }
    },
  });

  return (
    <div className="skill" ref={ref}>
      <div className="skill-name">{skill}</div>
      <div className="skill-percentage">{count}%</div>
    </div>
  );
};

const SkillsBox = () => {
  const skills = [
    { skill: 'HTML', percentage: 90 },
    { skill: 'CSS', percentage: 90 },
    { skill: 'Java', percentage: 60 },
    { skill: 'Python', percentage: 80 },
    { skill: 'C/C++/C#', percentage: 50 },
  ];

  return (
    <div className="skills-box">
      {skills.map((skill, index) => (
        <Skill key={index} skill={skill.skill} percentage={skill.percentage} />
      ))}
    </div>
  );
};

export default SkillsBox;
