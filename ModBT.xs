#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"
#include "libbtt/bt_types.h"
#include "apache2/mod_bt.h"
#include "modperl_const.h"
#include "modperl_perl_global.h"
#include "modperl_hooks.h"
#include "modperl_types.h"
#include "modperl_apache_includes.h"
#include "modperl_util.h"
#include "modperl_handler.h"
#include "modperl_xs_typedefs.h"
#include "httpd.h"
#include "http_config.h"
#include "http_log.h"
#include "http_request.h"
#include "http_protocol.h"
#include "http_core.h"
#include "util_filter.h"
#include "mpm.h"

MODULE = Apache::ModBT		PACKAGE = Apache::Server

Net::BitTorrent::LibBTT::Tracker
ModBT_Tracker(server)
	Apache::Server server
	
	CODE:
	perltracker *rv;
	modbt_config_t *cfg = ap_get_module_config(server->module_config, &bt_module);

	New(0, rv, 1, perltracker);
	
	apr_pool_create(&rv->p, cfg->tracker->p);
	rv->master = -1;
	rv->tracker = cfg->tracker;

	RETVAL = (Net__BitTorrent__LibBTT__Tracker) rv;
	
	OUTPUT:
	RETVAL
	
