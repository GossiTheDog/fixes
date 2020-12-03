@echo off

@rem -- Fix for RpcEptMapper and Dnscache service permission issue allowing elevation of privilege on Windows 7 and Server 2008/2008 R2
@rem -- Make sure you have subinacl.exe (in this repositary) in same location as batch file.
@rem -- 
@rem -- Example deployment scenario: - drop files in SYSVOL file share, modify subinacl.exe location (e.g. \\domain\sysvol\subinacl.exe),
@rem -- call from Computer login script in GPO (or psexec \\*)

reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RpcEptMapper\Performance
subinacl.exe /subkeyreg HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RpcEptMapper\Performance /revoke=S-1-5-32-545

reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\Performance
subinacl.exe /subkeyreg HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\Performance /revoke=S-1-5-32-545
