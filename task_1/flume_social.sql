create table social (
  userid int,
  notify string,
  targetid int,
  `timestamp` timestamp
  )
  clustered by (userid) sorted by (userid) into 5 buckets
  stored as orc

