{
	"redis_host":	"{{ REDIS_SERVER_IP }}",
	"redis_port":	{{ REDIS_SERVER_PORT }},
	"redis_auth":	null,

	"http_host":	"0.0.0.0",
	"http_port":	7379,
	"threads":	4,

	"daemonize":	true,
	"websockets":	true,

	"database":	0,

	"acl": [
		{
			"disabled":	["DEBUG"]
		},

		{
			"http_basic_auth":	"user:password",
			"enabled":		["DEBUG"]
		}
	],

        "verbosity": 3,
        "logfile": "/var/log/webdis.log"
}
