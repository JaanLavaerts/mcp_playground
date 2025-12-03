CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    locale TEXT NOT NULL CHECK(locale IN ('en', 'fi', 'sv')),
    version TEXT NOT NULL,
    description TEXT,
    motto TEXT,
    user_name TEXT NOT NULL UNIQUE,  -- enforce unique usernames
    user_location TEXT NOT NULL,
    user_title TEXT NOT NULL,
    user_business_unit TEXT NOT NULL
);

CREATE TABLE certificates (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    description TEXT,
    issuer TEXT,
    issued_month INTEGER NOT NULL,
    issued_year INTEGER NOT NULL,
    expiration_month INTEGER,
    expiration_year INTEGER,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE expertises (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    description TEXT NOT NULL,
    level INTEGER NOT NULL CHECK(level BETWEEN 1 AND 5),
    years INTEGER NOT NULL CHECK(years >= 1),
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE projects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    description TEXT,
    name TEXT,
    project_start_month INTEGER NOT NULL,
    project_start_year INTEGER NOT NULL,
    project_end_month INTEGER,
    project_end_year INTEGER,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE degrees (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    started_at_month INTEGER NOT NULL,
    started_at_year INTEGER NOT NULL,
    graduation_month INTEGER,
    graduation_year INTEGER,
    major TEXT,
    school TEXT,
    description TEXT,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE working_experiences (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    description TEXT NOT NULL,
    employer TEXT NOT NULL,
    started_at_month INTEGER NOT NULL,
    started_at_year INTEGER NOT NULL,
    ended_at_month INTEGER,
    ended_at_year INTEGER,
    role TEXT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE strengths (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE positions_of_trust (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    description TEXT,
    started_at_month INTEGER NOT NULL,
    started_at_year INTEGER NOT NULL,
    ended_at_month INTEGER,
    ended_at_year INTEGER,
    organization TEXT,
    role TEXT,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE social_media (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    url TEXT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE hobbies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE language_skills (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    language_code TEXT NOT NULL,
    level INTEGER NOT NULL CHECK(level BETWEEN 1 AND 5),
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE customer_quote (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    quote TEXT NOT NULL,
    quote_type TEXT NOT NULL CHECK(quote_type = 'customer'),
    source TEXT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE colleague_quote (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    quote TEXT NOT NULL,
    quote_type TEXT NOT NULL CHECK(quote_type = 'colleague'),
    source TEXT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE industry_knowledge (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    description TEXT NOT NULL,
    level INTEGER NOT NULL CHECK(level BETWEEN 1 AND 5),
    years INTEGER,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);
