# RcpEptMapper elevation of privilege patch

itm4n found a great vulnerability in Windows 7 and 2008 where authenticated (but non-administrator) local users can get SYSTEM rights:

https://itm4n.github.io/windows-registry-rpceptmapper-eop/

This is caused by Users having ability to create subkeys in two Windows services, although RcpEptMapper is really your route to admin.

# Patch.bat

This script is a fix for RcpEptMapper and Dnscache service permission issue, allowing elevation of privilege on Windows 7 and Server 2008/2008 R2
Make sure you have subinacl.exe (in this repositary) in same location as batch file.  

Example deployment scenarioes:

1. Easy
- Download all files and double click patch.bat

2. Enterprise
- drop files in SYSVOL file share, modify subinacl.exe location (e.g. \\domain\sysvol\subinacl.exe) in patch.bat
- call patch.bat from Computer login script in GPO (or psexec \\*)

# Requirements

This works on any version of Windows 7 and/or Windows Server 2008, including without extended security updates.

# Logic

patch.bat creates the Performance subkey, which can be used for elevation of privilege, and then revokes User access to it.
This way a non-administrator user cannot create the keys to load a malicious DLL.

# Disclaimers

SubInAcl.exe is an official Microsoft tool.  This patch is not an official Microsoft tool.
