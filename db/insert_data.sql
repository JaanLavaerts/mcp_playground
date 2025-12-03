-- ----------------------
-- 5 Dummy Employees
-- ----------------------

-- Main CV table
INSERT INTO users (id, locale, version, description, motto, user_name, user_location, user_title, user_business_unit) VALUES
(1, 'en', '1.0', 'Experienced software engineer.', 'Code with passion.', 'Alice Smith', 'New York', 'Software Engineer', 'Engineering'),
(2, 'fi', '1.1', 'Project manager with 10 years experience.', 'Deliver results.', 'Bob Virtanen', 'Helsinki', 'Project Manager', 'Operations'),
(3, 'sv', '1.0', 'Marketing specialist in Nordic markets.', 'Think big.', 'Carla Eriksson', 'Stockholm', 'Marketing Specialist', 'Marketing'),
(4, 'en', '2.0', 'Financial analyst and advisor.', 'Numbers speak.', 'David Lee', 'London', 'Financial Analyst', 'Finance'),
(5, 'fi', '1.2', 'UX designer focused on mobile apps.', 'Design everything.', 'Ella Korhonen', 'Turku', 'UX Designer', 'Design');

-- Certificates
INSERT INTO certificates (user_id, description, issuer, issued_month, issued_year, expiration_month, expiration_year) VALUES
(1, 'AWS Certified Developer', 'Amazon', 5, 2020, 5, 2023),
(2, 'PMP Certification', 'PMI', 6, 2018, NULL, NULL),
(3, 'Google Analytics Certified', 'Google', 3, 2021, NULL, NULL),
(4, 'CFA Level 1', 'CFA Institute', 7, 2019, NULL, NULL),
(5, 'Interaction Design Certificate', 'Nielsen Norman', 9, 2020, NULL, NULL);

-- Expertises
INSERT INTO expertises (user_id, description, level, years) VALUES
(1, 'Python', 5, 8),
(1, 'JavaScript', 4, 7),
(2, 'Project Planning', 5, 10),
(3, 'Digital Marketing', 4, 6),
(4, 'Financial Analysis', 5, 9),
(5, 'UX Research', 4, 5);

-- Projects
INSERT INTO projects (user_id, description, name, project_start_month, project_start_year, project_end_month, project_end_year) VALUES
(1, 'Developed internal dashboard', 'Internal Dashboard', 1, 2021, 12, 2021),
(2, 'Managed ERP migration', 'ERP Migration', 3, 2019, 9, 2019),
(3, 'Launched new campaign', 'Summer Campaign', 5, 2020, 8, 2020),
(4, 'Financial reporting tool', 'Finance Tool', 2, 2021, 10, 2021),
(5, 'Redesigned mobile app', 'Mobile App Redesign', 6, 2020, 12, 2020);

-- Degrees
INSERT INTO degrees (user_id, started_at_month, started_at_year, graduation_month, graduation_year, major, school, description) VALUES
(1, 9, 2010, 6, 2014, 'Computer Science', 'MIT', 'Bachelor of Science in Computer Science'),
(2, 8, 2005, 6, 2009, 'Business Administration', 'Helsinki University', 'Bachelor degree in Business Administration'),
(3, 9, 2008, 6, 2012, 'Marketing', 'Stockholm School of Economics', 'Bachelor in Marketing'),
(4, 9, 2011, 6, 2015, 'Finance', 'London School of Economics', 'Bachelor in Finance'),
(5, 9, 2012, 6, 2016, 'Interaction Design', 'Aalto University', 'Bachelor in UX Design');

-- Working Experiences
INSERT INTO working_experiences (user_id, description, employer, started_at_month, started_at_year, ended_at_month, ended_at_year, role) VALUES
(1, 'Backend developer for web applications', 'TechCorp', 7, 2014, 12, 2018, 'Software Engineer'),
(2, 'Led cross-functional projects', 'GlobalCorp', 1, 2010, 12, 2020, 'Project Manager'),
(3, 'Managed marketing campaigns', 'AdAgency', 3, 2012, 12, 2018, 'Marketing Specialist'),
(4, 'Financial analysis and reporting', 'FinConsult', 5, 2015, 12, 2021, 'Financial Analyst'),
(5, 'UX designer for mobile applications', 'DesignStudio', 6, 2016, 12, 2021, 'UX Designer');

-- Strengths
INSERT INTO strengths (user_id, name) VALUES
(1, 'Problem Solving'),
(1, 'Teamwork'),
(2, 'Leadership'),
(2, 'Organization'),
(3, 'Creativity'),
(3, 'Communication'),
(4, 'Analytical Thinking'),
(5, 'Design Thinking');

-- Positions of Trust
INSERT INTO positions_of_trust (user_id, description, started_at_month, started_at_year, ended_at_month, ended_at_year, organization, role) VALUES
(1, 'Mentor for new hires', 2, 2019, 12, 2021, 'TechCorp', 'Mentor'),
(2, 'Committee member', 1, 2017, 12, 2020, 'GlobalCorp', 'Member'),
(3, 'Board advisor', 3, 2018, 12, 2021, 'AdAgency', 'Advisor');

-- Social Media
INSERT INTO social_media (user_id, name, url) VALUES
(1, 'LinkedIn', 'https://www.linkedin.com/in/alicesmith'),
(2, 'LinkedIn', 'https://www.linkedin.com/in/bobvirtanen'),
(3, 'LinkedIn', 'https://www.linkedin.com/in/carlaeriksson'),
(4, 'LinkedIn', 'https://www.linkedin.com/in/davidlee'),
(5, 'LinkedIn', 'https://www.linkedin.com/in/ellakorhonen');

-- Hobbies
INSERT INTO hobbies (user_id, name) VALUES
(1, 'Cycling'),
(2, 'Photography'),
(3, 'Traveling'),
(4, 'Chess'),
(5, 'Painting');

-- Language Skills
INSERT INTO language_skills (user_id, language_code, level) VALUES
(1, 'en', 5),
(1, 'fi', 3),
(2, 'fi', 5),
(2, 'en', 4),
(3, 'sv', 5),
(3, 'en', 4),
(4, 'en', 5),
(4, 'sv', 3),
(5, 'fi', 5),
(5, 'en', 4);

-- Customer Quotes
INSERT INTO customer_quote (user_id, quote, quote_type, source) VALUES
(1, 'Alice delivered exceptional backend solutions.', 'customer', 'John Doe'),
(2, 'Bob managed our project efficiently.', 'customer', 'Maria Korhonen'),
(3, 'Carla improved our marketing results.', 'customer', 'Lars Svensson');

-- Colleague Quotes
INSERT INTO colleague_quote (user_id, quote, quote_type, source) VALUES
(1, 'Alice is a great team player.', 'colleague', 'Sam White'),
(2, 'Bob is an excellent leader.', 'colleague', 'Anna Virtanen'),
(3, 'Carla is creative and reliable.', 'colleague', 'Erik Andersson');

-- Industry Knowledge
INSERT INTO industry_knowledge (user_id, description, level, years) VALUES
(1, 'Cloud Computing', 5, 6),
(2, 'Project Management', 5, 10),
(3, 'Digital Marketing', 4, 7),
(4, 'Financial Services', 5, 9),
(5, 'UX Design', 4, 5);
