# To enable in RHEL, you just need EPEL repos
# See http://docs.saltstack.com/topics/installation/rhel.html
#
# TODO: Add checks for EPEL on RHEL
#
# For Fedora, saltstack is in the standard repos.
# Class salt::repo::rpm
# Does nothing
class salt::repo::rpm { }
#
# vim:shiftwidth=2:tabstop=2:softtabstop=2:expandtab:smartindent

