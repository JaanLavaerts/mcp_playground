SELECT json_object(
        'id', u.id,
        'user_name', u.user_name,
        'locale', u.locale,
        'version', u.version,
        'description', u.description,
        'motto', u.motto,
        'user_location', u.user_location,
        'user_title', u.user_title,
        'user_business_unit', u.user_business_unit,
        'certificates', (
            SELECT json_group_array(
                json_object(
                    'id', c.id,
                    'description', c.description,
                    'issuer', c.issuer,
                    'issued_month', c.issued_month,
                    'issued_year', c.issued_year,
                    'expiration_month', c.expiration_month,
                    'expiration_year', c.expiration_year
                )
            )
            FROM certificates c
            WHERE c.user_id = u.id
        ),
        'expertises', (
            SELECT json_group_array(
                json_object(
                    'id', e.id,
                    'description', e.description,
                    'level', e.level,
                    'years', e.years
                )
            )
            FROM expertises e
            WHERE e.user_id = u.id
        ),
        'projects', (
            SELECT json_group_array(
                json_object(
                    'id', p.id,
                    'name', p.name,
                    'description', p.description,
                    'project_start_month', p.project_start_month,
                    'project_start_year', p.project_start_year,
                    'project_end_month', p.project_end_month,
                    'project_end_year', p.project_end_year
                )
            )
            FROM projects p
            WHERE p.user_id = u.id
        ),
        'degrees', (
            SELECT json_group_array(
                json_object(
                    'id', d.id,
                    'started_at_month', d.started_at_month,
                    'started_at_year', d.started_at_year,
                    'graduation_month', d.graduation_month,
                    'graduation_year', d.graduation_year,
                    'major', d.major,
                    'school', d.school,
                    'description', d.description
                )
            )
            FROM degrees d
            WHERE d.user_id = u.id
        ),
        'working_experiences', (
            SELECT json_group_array(
                json_object(
                    'id', w.id,
                    'description', w.description,
                    'employer', w.employer,
                    'started_at_month', w.started_at_month,
                    'started_at_year', w.started_at_year,
                    'ended_at_month', w.ended_at_month,
                    'ended_at_year', w.ended_at_year,
                    'role', w.role
                )
            )
            FROM working_experiences w
            WHERE w.user_id = u.id
        ),
        'strengths', (
            SELECT json_group_array(
                json_object(
                    'id', s.id,
                    'name', s.name
                )
            )
            FROM strengths s
            WHERE s.user_id = u.id
        ),
        'positions_of_trust', (
            SELECT json_group_array(
                json_object(
                    'id', pt.id,
                    'description', pt.description,
                    'started_at_month', pt.started_at_month,
                    'started_at_year', pt.started_at_year,
                    'ended_at_month', pt.ended_at_month,
                    'ended_at_year', pt.ended_at_year,
                    'organization', pt.organization,
                    'role', pt.role
                )
            )
            FROM positions_of_trust pt
            WHERE pt.user_id = u.id
        ),
        'social_media', (
            SELECT json_group_array(
                json_object(
                    'id', sm.id,
                    'name', sm.name,
                    'url', sm.url
                )
            )
            FROM social_media sm
            WHERE sm.user_id = u.id
        ),
        'hobbies', (
            SELECT json_group_array(
                json_object(
                    'id', h.id,
                    'name', h.name
                )
            )
            FROM hobbies h
            WHERE h.user_id = u.id
        ),
        'language_skills', (
            SELECT json_group_array(
                json_object(
                    'id', ls.id,
                    'language_code', ls.language_code,
                    'level', ls.level
                )
            )
            FROM language_skills ls
            WHERE ls.user_id = u.id
        ),
        'customer_quotes', (
            SELECT json_group_array(
                json_object(
                    'id', cq.id,
                    'quote', cq.quote,
                    'source', cq.source
                )
            )
            FROM customer_quote cq
            WHERE cq.user_id = u.id
        ),
        'colleague_quotes', (
            SELECT json_group_array(
                json_object(
                    'id', cq.id,
                    'quote', cq.quote,
                    'source', cq.source
                )
            )
            FROM colleague_quote cq
            WHERE cq.user_id = u.id
        ),
        'industry_knowledge', (
            SELECT json_group_array(
                json_object(
                    'id', ik.id,
                    'description', ik.description,
                    'level', ik.level,
                    'years', ik.years
                )
            )
            FROM industry_knowledge ik
            WHERE ik.user_id = u.id
        )
    )
    FROM users u
    WHERE u.user_name = ?;