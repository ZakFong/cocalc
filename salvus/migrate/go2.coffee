db = new (require("cassandra").Salvus)(keyspace:'salvus', hosts:['10.240.97.10'], username:'hub', password:require('fs').readFileSync('data/secrets/cassandra/hub').toString().trim(), cb:(() -> x={};s=require('bup_server').global_client(database:db, cb:(err,c)->console.log("err=",err);x.c=c;x.c.migrate_update_recent_loop(limit:1, max_age_h:1, cb:(e)->console.log("DONE",e)))))
