use 5.006;
use ModPerl::MM ();
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
ModPerl::MM::WriteMakefile(
    NAME              => 'Apache::ModBT',
    VERSION_FROM      => 'lib/Apache/ModBT.pm', # finds $VERSION
    PREREQ_PM         => { "Net::BitTorrent::LibBTT" => "0.0.4" }, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Apache/ModBT.pm', # retrieve abstract from module
       AUTHOR         => 'Tyler \'Crackerjack\' MacDonald <tyler@yi.org>') : ()),
    LIBS              => [''], # e.g., '-lm'
    DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
    INC               => join(" ", '-I. -I../.. -I../../libbtt', ModPerl::MM::get_def_opt('INC')), # e.g., '-I. -I/usr/include/other',
#    TYPEMAPS			=> [ 'typemap' ],
	# Un-comment this if you add C files to link with later:
    OBJECT            => '../../libbtt/libbtt.a $(O_FILES)', # link all the C files too
);
