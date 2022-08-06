create database  stock on cluster  company_cluster;

drop table date_kline_qfq_all on cluster company_cluster;

create table stock.product_fund_local on cluster company_cluster
(
    code              String,
    adj               String   default 'bfq',
    agencybvol        Float32,
    agencybamt        Float32,
    allbvol           Float32,
    allbamt           Float32,
    agencysvol        Float32,
    agencysamt        Float32,
    allsvol           Float32,
    allsamt           Float32,
    allsco            Float32,
    all4sco           Float32,
    agencybvolrate    Float32,
    allbvolrate       Float32,
    agencysvolrate    Float32,
    allsvolrate       Float32,
    agency1bsvolrate  Float32,
    agency3bsvolrate  Float32,
    agency5bsvolrate  Float32,
    agency10bsvolrate Float32,
    agency20bsvolrate Float32,
    avg5allbsvol      Float32,
    agency2bsvol      Float32,
    agency4bsvol      Float32,
    agency9bsvol      Float32,
    agency19bsvol     Float32,
    agency2bsamt      Float32,
    agency4bsamt      Float32,
    agency6bsamt      Float32,
    all2bsamt         Float32,
    all4bsamt         Float32,
    all9bsamt         Float32,
    avg5perminsvol    Float32,
    agency1bsamt      Float32,
    agency3bsamt      Float32,
    agency5bsamt      Float32,
    agency7bsamt      Float32,
    agencybsco        Float32,
    agencyssco        Float32,
    all10bsamt        Float32,
    all1bsamt         Float32,
    all3bsamt         Float32,
    all5bsamt         Float32,
    allvolrate        Float32,
    avg5allsco        Float32,
    freq              String,
    priteambsco       Int16,
    priteamssco       Int16,
    publicbsco        Int16,
    publicssco        Int16,
    trade_minutes     Int16,
    trade_date        Date,
    trade_time        String,
    create_time       DateTime default now()
)
    engine = ReplicatedReplacingMergeTree('/clickhouse/tables/{shard}/product_fund', '{replica}', create_time)
        PARTITION BY toYYYYMMDD(trade_date)
        ORDER BY (code, trade_date, trade_time)
        SETTINGS index_granularity = 8192;


