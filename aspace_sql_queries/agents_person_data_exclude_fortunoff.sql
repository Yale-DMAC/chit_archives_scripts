SELECT DISTINCT CONCAT('/agents/people/', np.agent_person_id) as uri
	, np.sort_name
	, CONCAT(np.rest_of_name, ' ', np.primary_name) as name_concat
	, nai.authority_id
	, np.primary_name
	, np.rest_of_name
	, np.dates
	, np.title
	, np.qualifier
	, np.suffix
	, np.prefix
	, np.number
	, np.fuller_form 
	, ap.publish
	, ap.create_time
	, ap.created_by
	, ap.user_mtime
	, ap.last_modified_by
FROM name_person np
JOIN agent_person ap on ap.id = np.agent_person_id
LEFT JOIN name_authority_id nai on nai.name_person_id = np.id
LEFT JOIN user on user.agent_record_id = np.agent_person_id
LEFT JOIN linked_agents_rlshp lar on lar.agent_person_id = np.agent_person_id
JOIN resource on resource.id = lar.resource_id
LEFT JOIN date on date.agent_person_id = np.agent_person_id
WHERE np.is_display_name is not null
AND user.id is null
#AND np.rest_of_name is not null
AND (np.qualifier not like '%$t%' or np.qualifier is null)
AND (resource.repo_id != 14 and resource.repo_id is null or resource.repo_id in (2,3,4,5,6,7,8,9,10,11,12,13,15))
UNION
SELECT DISTINCT CONCAT('/agents/people/', np.agent_person_id) as uri
	, np.sort_name
	, CONCAT(np.rest_of_name, ' ', np.primary_name) as name_concat
	, nai.authority_id
	, np.primary_name
	, np.rest_of_name
	, np.dates
	, np.title
	, np.qualifier
	, np.suffix
	, np.prefix
	, np.number
	, np.fuller_form 
	, ap.publish
	, ap.create_time
	, ap.created_by
	, ap.user_mtime
	, ap.last_modified_by
FROM name_person np
JOIN agent_person ap on ap.id = np.agent_person_id
LEFT JOIN name_authority_id nai on nai.name_person_id = np.id
LEFT JOIN user on user.agent_record_id = np.agent_person_id
LEFT JOIN linked_agents_rlshp lar on lar.agent_person_id = np.agent_person_id
JOIN archival_object ao on ao.id = lar.archival_object_id
LEFT JOIN date on date.agent_person_id = np.agent_person_id
WHERE np.is_display_name is not null
AND user.id is null
#AND np.rest_of_name is not null
AND (np.qualifier not like '%$t%' or np.qualifier is null)
AND (ao.repo_id != 14 and ao.repo_id is null or ao.repo_id in (2,3,4,5,6,7,8,9,10,11,12,13,15))
UNION
SELECT DISTINCT CONCAT('/agents/people/', np.agent_person_id) as uri
	, np.sort_name
	, CONCAT(np.rest_of_name, ' ', np.primary_name) as name_concat
	, nai.authority_id
	, np.primary_name
	, np.rest_of_name
	, np.dates
	, np.title
	, np.qualifier
	, np.suffix
	, np.prefix
	, np.number
	, np.fuller_form 
	, ap.publish
	, ap.create_time
	, ap.created_by
	, ap.user_mtime
	, ap.last_modified_by
FROM name_person np
JOIN agent_person ap on ap.id = np.agent_person_id
LEFT JOIN name_authority_id nai on nai.name_person_id = np.id
LEFT JOIN user on user.agent_record_id = np.agent_person_id
LEFT JOIN linked_agents_rlshp lar on lar.agent_person_id = np.agent_person_id
JOIN accession on accession.id = lar.accession_id
LEFT JOIN date on date.agent_person_id = np.agent_person_id
WHERE np.is_display_name is not null
AND user.id is null
#AND np.rest_of_name is not null
AND (np.qualifier not like '%$t%' or np.qualifier is null)
AND (accession.repo_id != 14 and accession.repo_id is null or accession.repo_id in (2,3,4,5,6,7,8,9,10,11,12,13,15))
order by name_concat