create view displayedMenu as
select p.NUME, p.PRET, m.CANTITATE  from meniu m
join PRODUSE p  on m.ID_PRODUS = p.ID_PRODUS;

create or replace view DisplayedRatingOnId as
select r.ID_PRODUS  , GETRATING(r.ID_PRODUS) as Average from rating r
group by (r.ID_PRODUS);


create or replace view DisplayRating as
select p.nume, d.Average from DisplayedRating d
join  Produse p on d.ID_PRODUS = p.ID_PRODUS;

select * from DisplayRating;
-- join rating rr on r.ID_PRODUS = rr.ID_PRODUS;