# RpcEptMapper elevation of privilege patch

itm4n found a great vulnerability in Windows 7 and 2008 where authenticated (but non-administrator) local users can get SYSTEM rights:

https://itm4n.github.io/windows-registry-rpceptmapper-eop/

This is caused by (non-admin) Users having ability to create subkeys in two Windows services.

# Patch.bat

This script is a fix for RpcEptMapper and Dnscache service permission issue, allowing elevation of privilege on Windows 7 and Server 2008/2008 R2.

# Example deployment situations

1. Easy
- Download all files and double click patch.bat

2. Enterprise
- drop files in SYSVOL file share, modify subinacl.exe location (e.g. \\\domain\sysvol\subinacl.exe) in patch.bat
- call patch.bat from Computer login script in GPO (or psexec \\\\*)

# Requirements

- This works on any version of Windows 7 and/or Windows Server 2008, including without extended security updates.

- Make sure you have subinacl.exe (in this repository) in same location as batch file.  

# Logic

patch.bat creates the Performance subkey, which can be used for elevation of privilege, and then revokes User access to it.
This way a non-administrator user cannot create the keys to load a malicious DLL.

# Errors

Error 1337 - if you have non-English language Windows, you need to change "Users" to the name of your local Users group in Windows.

# Disclaimers

SubInAcl.exe is an official Microsoft tool.  This patch is not an official Microsoft tool.
