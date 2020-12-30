# Phylogenetic data

[@Rambaut2020Nov]

[@Singer2020Jun]



```r
library(sars2pack)
library(ggplot2)
library(dplyr)
library(ggtree)
library(ape)
library(stringr)
```


```r
ntr = cov_glue_newick_data()
```

```
## Warning in with_tz(Sys.time(), tzone): Unrecognized time zone ''
```


see See Figure \@ref(fig:ggtreeNewick)



```r
groups = str_match(ntr$tip.label,'.*_([A-Z][\\.]?[0-9]?[0-9]?).*')
ntr = groupOTU(ntr, split(ntr$tip.label,groups[,2]))
ggtree(ntr, aes(color=group), layout="circular", branch.length="none") +
  geom_tiplab(size=3, aes(angle=angle)) +
  ggtitle('COVID Glue Phylogenetic Clades')
```

\begin{figure}
\includegraphics[width=1\linewidth]{phylogenetics_files/figure-latex/ggtreeNewick-1} \caption{abc}(\#fig:ggtreeNewick)
\end{figure}


```r
dat = cov_glue_lineage_data()
dat = dat %>%
    dplyr::mutate(lineage = sub('^([^.][.]?[^.]+).*', '\\1', lineage)) %>%
    dplyr::mutate(region = countrycode::countrycode(country,origin='country.name',
                                                    destination='region')) %>%
    dplyr::group_by(epiweek,lineage,region) %>% 
    dplyr::summarize(cases=n()) %>%
    dplyr::filter(!is.na(region)) %>%
    dplyr::ungroup()
```

```
## `summarise()` regrouping output by 'epiweek', 'lineage' (override with `.groups` argument)
```

```r
head(dat)
```

```
## # A tibble: 6 x 4
##   epiweek lineage region              cases
##     <dbl> <chr>   <chr>               <int>
## 1       0 B       East Asia & Pacific     2
## 2       1 B       East Asia & Pacific    20
## 3       2 A       East Asia & Pacific     3
## 4       2 B       East Asia & Pacific     7
## 5       3 A       East Asia & Pacific     9
## 6       3 B       East Asia & Pacific    10
```


```r
p = dat %>%
    ggplot(aes(x=epiweek,y=cases,fill=lineage)) +
    geom_bar(stat='identity', position='fill') +
    facet_wrap("region",ncol=2) +
    theme(legend.position='bottom')
p
```


\includegraphics[width=1\linewidth]{phylogenetics_files/figure-latex/lineageSpread-1} 

## Notes

- https://nextstrain.org/help/general/how-to-read-a-tree

