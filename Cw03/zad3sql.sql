drop table MATCHES1;

create table matches1(
    host_team varchar(50),
    guest_team varchar(50),
    goals_host_team int,
    goals_guest_team int
    );
    
insert into matches1 values('Team A', 'Team B', 2, 0);
insert into matches1 values('Team C', 'Team D', 0, 1);
insert into matches1 values('Team E', 'Team C', 3, 0);
insert into matches1 values('Team A', 'Team D', 0, 0);
insert into matches1 values('Team C', 'Team B', 1, 2);
insert into matches1 values('Team F', 'Team D', 2, 2);
insert into matches1 values('Team F', 'Team B', 2, 3);
insert into matches1 values('Team A', 'Team F', 1, 0);
insert into matches1 values('Team A', 'Team E', 0, 0);
insert into matches1 values('Team F', 'Team E', 0, 2);


with goals as 
    (select 
        host_team, 
        COUNT(*) count_of_matches,
        SUM(goals_host_team) scored,
        sum(goals_guest_team) losted,
    
    sum (
    case 
        when 
            goals_host_team > goals_guest_team 
            then 3
        when 
            goals_host_team = goals_guest_team 
            then 1
        else 0 
    end) 
        points
        
    from 
        matches1
    group by 
        host_team
        
    union all 
    
    select 
        guest_team, 
        count(*) count_of_matches,
        SUM(goals_guest_team) scored, 
        sum(goals_host_team) losted,
    sum(case when goals_host_team < goals_guest_team then 3
        when goals_host_team = goals_guest_team then 1
        else 0 end) points
    from 
        matches1 
    group by 
        guest_team)
    
    select 
        host_team,
        sum(count_of_matches) count_of_matches,
        sum(scored) scored_goals,
        sum(losted) lost_goals,
        sum(points) league_points
    from 
        goals
    group by 
        host_team;